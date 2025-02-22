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
 * Specific AST walker that generates the call graph.
 */

#pragma once

#include <libjulia/optimiser/ASTWalker.h>

#include <boost/optional.hpp>

#include <set>
#include <map>

namespace dev
{
namespace julia
{

struct CallGraph
{
	std::map<std::string, std::set<std::string>> functionCalls;
	std::set<std::string> functionsWithLoops;
	/// @returns the set of functions contained in cycles in the call graph, i.e.
	/// functions that are part of a (mutual) recursion.
	/// Note that this does not include functions that merely call recursive functions.
	std::set<std::string> recursiveFunctions() const;
};

/**
 * Specific AST walker that generates the call graph.
 *
 * It also generates information about which functions contain for loops.
 *
 * The outermost (non-function) context is denoted by the empty string.
 */
class CallGraphGenerator: public ASTWalker
{
public:
	static std::map<std::string, std::set<std::string>> callGraph(Block const& _ast);
	static CallGraph callGraph2(Block const& _ast);

	using ASTWalker::operator();
	void operator()(FunctionalInstruction const& _functionalInstruction) override;
	void operator()(FunctionCall const& _functionCall) override;
	void operator()(ForLoop const& _forLoop) override;
	void operator()(FunctionDefinition const& _functionDefinition) override;

private:
	CallGraphGenerator();

	std::map<std::string, std::set<std::string>> m_callGraph;
	CallGraph m_callGraph2;
	/// The name of the function we are currently visiting during traversal.
	std::string m_currentFunction;
};

}
}
