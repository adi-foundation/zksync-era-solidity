/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
/**
 * @author Christian <c@ethdev.com>
 * @date 2014
 * Utilities for the solidity compiler.
 */

#include <libsolidity/codegen/CompilerContext.h>
#include <libsolidity/codegen/CompilerUtils.h>
#include <libsolidity/ast/AST.h>
#include <libsolidity/codegen/Compiler.h>
#include <libsolidity/interface/Version.h>
#include <libsolidity/interface/ErrorReporter.h>
#include <libsolidity/parsing/Scanner.h>
#include <libsolidity/inlineasm/AsmParser.h>
#include <libsolidity/inlineasm/AsmCodeGen.h>
#include <libsolidity/inlineasm/AsmAnalysis.h>
#include <libsolidity/inlineasm/AsmAnalysisInfo.h>

#include <boost/algorithm/string/replace.hpp>

#include <utility>
#include <numeric>

using namespace std;

namespace dev
{
namespace solidity
{

void CompilerContext::addMagicGlobal(MagicVariableDeclaration const& _declaration)
{
	m_magicGlobals.insert(&_declaration);
}

void CompilerContext::addStateVariable(
	VariableDeclaration const& _declaration,
	u256 const& _storageOffset,
	unsigned _byteOffset
)
{
	m_stateVariables[&_declaration] = make_pair(_storageOffset, _byteOffset);
}

void CompilerContext::startFunction(Declaration const& _function)
{
	m_functionCompilationQueue.startFunction(_function);
	*this << functionEntryLabel(_function);
}

void CompilerContext::callLowLevelFunction(
	string const& _name,
	unsigned _inArgs,
	unsigned _outArgs,
	function<void(CompilerContext&)> const& _generator
)
{
	eth::AssemblyItem retTag = pushNewTag();
	CompilerUtils(*this).moveIntoStack(_inArgs);

	*this << lowLevelFunctionTag(_name, _inArgs, _outArgs, _generator);

	appendJump(eth::AssemblyItem::JumpType::IntoFunction);
	adjustStackOffset(int(_outArgs) - 1 - _inArgs);
	*this << retTag.tag();
}

eth::AssemblyItem CompilerContext::lowLevelFunctionTag(
	string const& _name,
	unsigned _inArgs,
	unsigned _outArgs,
	function<void(CompilerContext&)> const& _generator
)
{
	auto it = m_lowLevelFunctions.find(_name);
	if (it == m_lowLevelFunctions.end())
	{
		eth::AssemblyItem tag = newTag().pushTag();
		m_lowLevelFunctions.insert(make_pair(_name, tag));
		m_lowLevelFunctionGenerationQueue.push(make_tuple(_name, _inArgs, _outArgs, _generator));
		return tag;
	}
	else
		return it->second;
}

eth::AssemblyItem CompilerContext::lowLevelFunctionTagIfExists(string const& _name)
{
	auto it = m_lowLevelFunctions.find(_name);
	if (it == m_lowLevelFunctions.end())
		return eth::AssemblyItem(eth::UndefinedItem);
	else
		return it->second;
}

void CompilerContext::appendMissingLowLevelFunctions()
{
	while (!m_lowLevelFunctionGenerationQueue.empty())
	{
		string name;
		unsigned inArgs;
		unsigned outArgs;
		function<void(CompilerContext&)> generator;
		tie(name, inArgs, outArgs, generator) = m_lowLevelFunctionGenerationQueue.front();
		m_lowLevelFunctionGenerationQueue.pop();

		setStackOffset(inArgs + 1);
		*this << m_lowLevelFunctions.at(name).tag();
		generator(*this);
		CompilerUtils(*this).moveToStackTop(outArgs);
		appendJump(eth::AssemblyItem::JumpType::OutOfFunction);
		solAssert(stackHeight() == outArgs, "Invalid stack height in low-level function " + name + ".");
	}
}

void CompilerContext::addVariable(VariableDeclaration const& _declaration,
								  unsigned _offsetToCurrent)
{
	solAssert(m_asm->deposit() >= 0 && unsigned(m_asm->deposit()) >= _offsetToCurrent, "");
	solAssert(m_localVariables.count(&_declaration) == 0, "Variable already present");
	m_localVariables[&_declaration] = unsigned(m_asm->deposit()) - _offsetToCurrent;
}

void CompilerContext::removeVariable(VariableDeclaration const& _declaration)
{
	solAssert(!!m_localVariables.count(&_declaration), "");
	m_localVariables.erase(&_declaration);
}

eth::Assembly const& CompilerContext::compiledContract(const ContractDefinition& _contract) const
{
	auto ret = m_compiledContracts.find(&_contract);
	solAssert(ret != m_compiledContracts.end(), "Compiled contract not found.");
	return *ret->second;
}

bool CompilerContext::isLocalVariable(Declaration const* _declaration) const
{
	return !!m_localVariables.count(_declaration);
}

eth::AssemblyItem CompilerContext::functionEntryLabel(Declaration const& _declaration)
{
	return m_functionCompilationQueue.entryLabel(_declaration, *this);
}

eth::AssemblyItem CompilerContext::functionEntryLabelIfExists(Declaration const& _declaration) const
{
	return m_functionCompilationQueue.entryLabelIfExists(_declaration);
}

FunctionDefinition const& CompilerContext::resolveVirtualFunction(FunctionDefinition const& _function)
{
	// Libraries do not allow inheritance and their functions can be inlined, so we should not
	// search the inheritance hierarchy (which will be the wrong one in case the function
	// is inlined).
	if (auto scope = dynamic_cast<ContractDefinition const*>(_function.scope()))
		if (scope->isLibrary())
			return _function;
	solAssert(!m_inheritanceHierarchy.empty(), "No inheritance hierarchy set.");
	return resolveVirtualFunction(_function, m_inheritanceHierarchy.begin());
}

FunctionDefinition const& CompilerContext::superFunction(FunctionDefinition const& _function, ContractDefinition const& _base)
{
	solAssert(!m_inheritanceHierarchy.empty(), "No inheritance hierarchy set.");
	return resolveVirtualFunction(_function, superContract(_base));
}

FunctionDefinition const* CompilerContext::nextConstructor(ContractDefinition const& _contract) const
{
	vector<ContractDefinition const*>::const_iterator it = superContract(_contract);
	for (; it != m_inheritanceHierarchy.end(); ++it)
		if ((*it)->constructor())
			return (*it)->constructor();

	return nullptr;
}

Declaration const* CompilerContext::nextFunctionToCompile() const
{
	return m_functionCompilationQueue.nextFunctionToCompile();
}

ContractDefinition const& CompilerContext::mostDerivedContract() const
{
	solAssert(m_mostDerivedContract, "Most derived contract not set.");
	return *m_mostDerivedContract;
}

ModifierDefinition const& CompilerContext::functionModifier(string const& _name) const
{
	solAssert(!m_inheritanceHierarchy.empty(), "No inheritance hierarchy set.");
	for (ContractDefinition const* contract: m_inheritanceHierarchy)
		for (ModifierDefinition const* modifier: contract->functionModifiers())
			if (modifier->name() == _name)
				return *modifier;
	BOOST_THROW_EXCEPTION(InternalCompilerError()
		<< errinfo_comment("Function modifier " + _name + " not found."));
}

unsigned CompilerContext::baseStackOffsetOfVariable(Declaration const& _declaration) const
{
	auto res = m_localVariables.find(&_declaration);
	solAssert(res != m_localVariables.end(), "Variable not found on stack.");
	return res->second;
}

unsigned CompilerContext::baseToCurrentStackOffset(unsigned _baseOffset) const
{
	return m_asm->deposit() - _baseOffset - 1;
}

unsigned CompilerContext::currentToBaseStackOffset(unsigned _offset) const
{
	return m_asm->deposit() - _offset - 1;
}

pair<u256, unsigned> CompilerContext::storageLocationOfVariable(const Declaration& _declaration) const
{
	auto it = m_stateVariables.find(&_declaration);
	solAssert(it != m_stateVariables.end(), "Variable not found in storage.");
	return it->second;
}

CompilerContext& CompilerContext::appendJump(eth::AssemblyItem::JumpType _jumpType)
{
	eth::AssemblyItem item(Instruction::JUMP);
	item.setJumpType(_jumpType);
	return *this << item;
}

CompilerContext& CompilerContext::appendInvalid()
{
	return *this << Instruction::INVALID;
}

CompilerContext& CompilerContext::appendConditionalInvalid()
{
	*this << Instruction::ISZERO;
	eth::AssemblyItem afterTag = appendConditionalJump();
	*this << Instruction::INVALID;
	*this << afterTag;
	return *this;
}

CompilerContext& CompilerContext::appendRevert()
{
	return *this << u256(0) << u256(0) << Instruction::REVERT;
}

CompilerContext& CompilerContext::appendConditionalRevert()
{
	*this << Instruction::ISZERO;
	eth::AssemblyItem afterTag = appendConditionalJump();
	appendRevert();
	*this << afterTag;
	return *this;
}

void CompilerContext::resetVisitedNodes(ASTNode const* _node)
{
	stack<ASTNode const*> newStack;
	newStack.push(_node);
	std::swap(m_visitedNodes, newStack);
	updateSourceLocation();
}

void CompilerContext::appendInlineAssembly(
	string const& _assembly,
	vector<string> const& _localVariables,
	map<string, string> const& _replacements
)
{
	string replacedAssembly;
	string const* assembly = &_assembly;
	if (!_replacements.empty())
	{
		replacedAssembly = _assembly;
		for (auto const& replacement: _replacements)
			replacedAssembly = boost::algorithm::replace_all_copy(replacedAssembly, replacement.first, replacement.second);
		assembly = &replacedAssembly;
	}

	int startStackHeight = stackHeight();

	julia::ExternalIdentifierAccess identifierAccess;
	identifierAccess.resolve = [&](
		assembly::Identifier const& _identifier,
		julia::IdentifierContext,
		bool
	)
	{
		auto it = std::find(_localVariables.begin(), _localVariables.end(), _identifier.name);
		return it == _localVariables.end() ? size_t(-1) : 1;
	};
	identifierAccess.generateCode = [&](
		assembly::Identifier const& _identifier,
		julia::IdentifierContext _context,
		julia::AbstractAssembly& _assembly
	)
	{
		auto it = std::find(_localVariables.begin(), _localVariables.end(), _identifier.name);
		solAssert(it != _localVariables.end(), "");
		int stackDepth = _localVariables.end() - it;
		int stackDiff = _assembly.stackHeight() - startStackHeight + stackDepth;
		if (_context == julia::IdentifierContext::LValue)
			stackDiff -= 1;
		if (stackDiff < 1 || stackDiff > 16)
			BOOST_THROW_EXCEPTION(
				CompilerError() <<
				errinfo_comment("Stack too deep (" + to_string(stackDiff) + "), try removing local variables.")
			);
		if (_context == julia::IdentifierContext::RValue)
			_assembly.appendInstruction(dupInstruction(stackDiff));
		else
		{
			_assembly.appendInstruction(swapInstruction(stackDiff));
			_assembly.appendInstruction(Instruction::POP);
		}
	};

	ErrorList errors;
	ErrorReporter errorReporter(errors);
	auto scanner = make_shared<Scanner>(CharStream(*assembly), "--CODEGEN--");
	auto parserResult = assembly::Parser(errorReporter).parse(scanner);
	solAssert(parserResult, "Failed to parse inline assembly block.");
	solAssert(errorReporter.errors().empty(), "Failed to parse inline assembly block.");

	assembly::AsmAnalysisInfo analysisInfo;
	assembly::AsmAnalyzer analyzer(analysisInfo, errorReporter, false, identifierAccess.resolve);
	solAssert(analyzer.analyze(*parserResult), "Failed to analyze inline assembly block.");
	solAssert(errorReporter.errors().empty(), "Failed to analyze inline assembly block.");
	shared_ptr<julia::CodeTransform::Context> yulContext;
	assembly::CodeGenerator::assemble(*parserResult, analysisInfo, *m_asm, yulContext, identifierAccess);
}

FunctionDefinition const& CompilerContext::resolveVirtualFunction(
	FunctionDefinition const& _function,
	vector<ContractDefinition const*>::const_iterator _searchStart
)
{
	string name = _function.name();
	FunctionType functionType(_function);
	auto it = _searchStart;
	for (; it != m_inheritanceHierarchy.end(); ++it)
		for (FunctionDefinition const* function: (*it)->definedFunctions())
			if (
				function->name() == name &&
				!function->isConstructor() &&
				FunctionType(*function).hasEqualArgumentTypes(functionType)
			)
				return *function;
	solAssert(false, "Super function " + name + " not found.");
	return _function; // not reached
}

vector<ContractDefinition const*>::const_iterator CompilerContext::superContract(ContractDefinition const& _contract) const
{
	solAssert(!m_inheritanceHierarchy.empty(), "No inheritance hierarchy set.");
	auto it = find(m_inheritanceHierarchy.begin(), m_inheritanceHierarchy.end(), &_contract);
	solAssert(it != m_inheritanceHierarchy.end(), "Base not found in inheritance hierarchy.");
	return ++it;
}

void CompilerContext::updateSourceLocation()
{
	m_asm->setSourceLocation(m_visitedNodes.empty() ? SourceLocation() : m_visitedNodes.top()->location());
}

eth::AssemblyItem CompilerContext::FunctionCompilationQueue::entryLabel(
	Declaration const& _declaration,
	CompilerContext& _context
)
{
	auto res = m_entryLabels.find(&_declaration);
	if (res == m_entryLabels.end())
	{
		eth::AssemblyItem tag(_context.newTag());
		m_entryLabels.insert(make_pair(&_declaration, tag));
		m_functionsToCompile.push(&_declaration);
		return tag.tag();
	}
	else
		return res->second.tag();

}

eth::AssemblyItem CompilerContext::FunctionCompilationQueue::entryLabelIfExists(Declaration const& _declaration) const
{
	auto res = m_entryLabels.find(&_declaration);
	return res == m_entryLabels.end() ? eth::AssemblyItem(eth::UndefinedItem) : res->second.tag();
}

Declaration const* CompilerContext::FunctionCompilationQueue::nextFunctionToCompile() const
{
	while (!m_functionsToCompile.empty())
	{
		if (m_alreadyCompiledFunctions.count(m_functionsToCompile.front()))
			m_functionsToCompile.pop();
		else
			return m_functionsToCompile.front();
	}
	return nullptr;
}

void CompilerContext::FunctionCompilationQueue::startFunction(Declaration const& _function)
{
	if (!m_functionsToCompile.empty() && m_functionsToCompile.front() == &_function)
		m_functionsToCompile.pop();
	m_alreadyCompiledFunctions.insert(&_function);
}

}
}
