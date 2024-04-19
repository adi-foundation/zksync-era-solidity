// RUN: solc --mlir-action=print-llvm-ir --mlir-target=eravm %s | FileCheck %s
// RUN: solc --mlir-action=print-asm --mlir-target=eravm %s | FileCheck --check-prefix=ASM %s

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
	function f() public pure returns (uint) { return 42; }
}

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: ; ModuleID = 'LLVMDialectModule'
// CHECK-NEXT: source_filename = "LLVMDialectModule"
// CHECK-EMPTY:
// CHECK-NEXT: @ptr_active = private global ptr addrspace(3) undef
// CHECK-NEXT: @ptr_return_data = private global ptr addrspace(3) undef
// CHECK-NEXT: @ptr_calldata = private global ptr addrspace(3) undef
// CHECK-NEXT: @extra_abi_data = private global [10 x i256] zeroinitializer, align 32
// CHECK-NEXT: @call_flags = private global i256 0, align 32
// CHECK-NEXT: @returndatasize = private global i256 0, align 32
// CHECK-NEXT: @calldatasize = private global i256 0, align 32
// CHECK-NEXT: @memory_pointer = private global i256 0, align 32
// CHECK-EMPTY:
// CHECK-NEXT: declare ptr @malloc(i64)
// CHECK-EMPTY:
// CHECK-NEXT: declare void @free(ptr)
// CHECK-EMPTY:
// CHECK-NEXT: declare void @__return(i256, i256, i256)
// CHECK-EMPTY:
// CHECK-NEXT: define private void @.unreachable() !dbg !3 {
// CHECK-NEXT:   unreachable, !dbg !7
// CHECK-NEXT: }
// CHECK-EMPTY:
// CHECK-NEXT: declare void @__revert(i256, i256, i256)
// CHECK-EMPTY:
// CHECK-NEXT: define private void @__deploy() !dbg !10 {
// CHECK-NEXT:   store i256 128, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 1, !dbg !11
// CHECK-NEXT:   %1 = call i256 @llvm.eravm.getu128(), !dbg !11
// CHECK-NEXT:   %2 = icmp ne i256 %1, 0, !dbg !11
// CHECK-NEXT:   br i1 %2, label %3, label %4, !dbg !11
// CHECK-EMPTY:
// CHECK-NEXT: 3:                                                ; preds = %0
// CHECK-NEXT:   call void @__revert(i256 0, i256 0, i256 2), !dbg !11
// CHECK-NEXT:   call void @.unreachable(), !dbg !11
// CHECK-NEXT:   br label %4, !dbg !11
// CHECK-EMPTY:
// CHECK-NEXT: 4:                                                ; preds = %3, %0
// CHECK-NEXT:   %5 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 1, !dbg !11
// CHECK-NEXT:   %6 = inttoptr i256 %5 to ptr addrspace(1), !dbg !11
// CHECK-NEXT:   %7 = load ptr addrspace(3), ptr @ptr_calldata, align 32, !dbg !11
// CHECK-NEXT:   %8 = getelementptr i8, ptr addrspace(3) %7, i256 0, !dbg !11
// CHECK-NEXT:   call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) %6, ptr addrspace(3) %8, i256 0, i1 false), !dbg !11
// CHECK-NEXT:   store i256 32, ptr addrspace(2) inttoptr (i256 256 to ptr addrspace(2)), align 1, !dbg !11
// CHECK-NEXT:   store i256 0, ptr addrspace(2) inttoptr (i256 288 to ptr addrspace(2)), align 1, !dbg !11
// CHECK-NEXT:   call void @__return(i256 256, i256 64, i256 2), !dbg !11
// CHECK-NEXT:   call void @.unreachable(), !dbg !11
// CHECK-NEXT:   unreachable, !dbg !11
// CHECK-NEXT: }
// CHECK-EMPTY:
// CHECK-NEXT: define private void @__runtime() !dbg !13 {
// CHECK-NEXT:   store i256 128, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 1, !dbg !14
// CHECK-NEXT:   %1 = load i256, ptr @calldatasize, align 32, !dbg !14
// CHECK-NEXT:   %2 = icmp uge i256 %1, 4, !dbg !14
// CHECK-NEXT:   br i1 %2, label %3, label %19, !dbg !14
// CHECK-EMPTY:
// CHECK-NEXT: 3:                                                ; preds = %0
// CHECK-NEXT:   %4 = load ptr addrspace(3), ptr @ptr_calldata, align 32, !dbg !14
// CHECK-NEXT:   %5 = getelementptr i8, ptr addrspace(3) %4, i256 0, !dbg !14
// CHECK-NEXT:   %6 = load i256, ptr addrspace(3) %5, align 1, !dbg !14
// CHECK-NEXT:   switch i256 %6, label %17 [
// CHECK-NEXT:     i256 638722032, label %7
// CHECK-NEXT:   ], !dbg !14
// CHECK-EMPTY:
// CHECK-NEXT: 7:                                                ; preds = %3
// CHECK-NEXT:   %8 = call i256 @llvm.eravm.getu128(), !dbg !14
// CHECK-NEXT:   %9 = icmp ne i256 %8, 0, !dbg !14
// CHECK-NEXT:   br i1 %9, label %10, label %11, !dbg !14
// CHECK-EMPTY:
// CHECK-NEXT: 10:                                               ; preds = %7
// CHECK-NEXT:   call void @__revert(i256 0, i256 0, i256 0), !dbg !14
// CHECK-NEXT:   call void @.unreachable(), !dbg !14
// CHECK-NEXT:   br label %11, !dbg !14
// CHECK-EMPTY:
// CHECK-NEXT: 11:                                               ; preds = %10, %7
// CHECK-NEXT:   %12 = call i256 @f_9(), !dbg !14
// CHECK-NEXT:   %13 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 1, !dbg !14
// CHECK-NEXT:   %14 = add i256 %13, 32, !dbg !14
// CHECK-NEXT:   %15 = inttoptr i256 %13 to ptr addrspace(1), !dbg !14
// CHECK-NEXT:   store i256 %12, ptr addrspace(1) %15, align 1, !dbg !14
// CHECK-NEXT:   %16 = sub i256 %14, %13, !dbg !14
// CHECK-NEXT:   call void @__return(i256 %13, i256 %16, i256 0), !dbg !14
// CHECK-NEXT:   call void @.unreachable(), !dbg !14
// CHECK-NEXT:   br label %18, !dbg !14
// CHECK-EMPTY:
// CHECK-NEXT: 17:                                               ; preds = %3
// CHECK-NEXT:   br label %18, !dbg !14
// CHECK-EMPTY:
// CHECK-NEXT: 18:                                               ; preds = %17, %11
// CHECK-NEXT:   br label %19, !dbg !14
// CHECK-EMPTY:
// CHECK-NEXT: 19:                                               ; preds = %18, %0
// CHECK-NEXT:   call void @__revert(i256 0, i256 0, i256 0), !dbg !14
// CHECK-NEXT:   call void @.unreachable(), !dbg !14
// CHECK-NEXT:   unreachable, !dbg !14
// CHECK-NEXT: }
// CHECK-EMPTY:
// CHECK-NEXT: define i256 @__entry(ptr addrspace(3) %0, i256 %1, i256 %2, i256 %3, i256 %4, i256 %5, i256 %6, i256 %7, i256 %8, i256 %9, i256 %10, i256 %11) !dbg !16 {
// CHECK-NEXT:   store i256 0, ptr @memory_pointer, align 32, !dbg !17
// CHECK-NEXT:   store i256 0, ptr @calldatasize, align 32, !dbg !17
// CHECK-NEXT:   store i256 0, ptr @returndatasize, align 32, !dbg !17
// CHECK-NEXT:   store i256 0, ptr @call_flags, align 32, !dbg !17
// CHECK-NEXT:   store <10 x i256> zeroinitializer, ptr @extra_abi_data, align 512, !dbg !17
// CHECK-NEXT:   store ptr addrspace(3) %0, ptr @ptr_calldata, align 32, !dbg !17
// CHECK-NEXT:   store i256 and (i256 lshr (i256 ptrtoint (ptr @ptr_calldata to i256), i256 96), i256 4294967295), ptr @calldatasize, align 32, !dbg !17
// CHECK-NEXT:   %13 = load i256, ptr @calldatasize, align 32, !dbg !17
// CHECK-NEXT:   %14 = getelementptr i8, ptr addrspace(3) %0, i256 %13, !dbg !17
// CHECK-NEXT:   store ptr addrspace(3) %14, ptr @ptr_return_data, align 32, !dbg !17
// CHECK-NEXT:   store ptr addrspace(3) %14, ptr @ptr_active, align 32, !dbg !17
// CHECK-NEXT:   store i256 %1, ptr @call_flags, align 32, !dbg !17
// CHECK-NEXT:   store i256 %2, ptr @extra_abi_data, align 32, !dbg !17
// CHECK-NEXT:   store i256 %3, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 1), align 32, !dbg !17
// CHECK-NEXT:   store i256 %4, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 2), align 32, !dbg !17
// CHECK-NEXT:   store i256 %5, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 3), align 32, !dbg !17
// CHECK-NEXT:   store i256 %6, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 4), align 32, !dbg !17
// CHECK-NEXT:   store i256 %7, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 5), align 32, !dbg !17
// CHECK-NEXT:   store i256 %8, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 6), align 32, !dbg !17
// CHECK-NEXT:   store i256 %9, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 7), align 32, !dbg !17
// CHECK-NEXT:   store i256 %10, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 8), align 32, !dbg !17
// CHECK-NEXT:   store i256 %11, ptr getelementptr inbounds ([10 x i256], ptr @extra_abi_data, i256 0, i256 9), align 32, !dbg !17
// CHECK-NEXT:   %15 = and i256 %1, 1, !dbg !17
// CHECK-NEXT:   %16 = icmp eq i256 %15, 1, !dbg !17
// CHECK-NEXT:   br i1 %16, label %17, label %18, !dbg !17
// CHECK-EMPTY:
// CHECK-NEXT: 17:                                               ; preds = %12
// CHECK-NEXT:   call void @__deploy(), !dbg !17
// CHECK-NEXT:   br label %19, !dbg !17
// CHECK-EMPTY:
// CHECK-NEXT: 18:                                               ; preds = %12
// CHECK-NEXT:   call void @__runtime(), !dbg !17
// CHECK-NEXT:   br label %19, !dbg !17
// CHECK-EMPTY:
// CHECK-NEXT: 19:                                               ; preds = %17, %18
// CHECK-NEXT:   unreachable, !dbg !17
// CHECK-NEXT: }
// CHECK-EMPTY:
// CHECK-NEXT: define private i256 @f_9.0() !dbg !19 {
// CHECK-NEXT:   ret i256 42, !dbg !20
// CHECK-NEXT: }
// CHECK-EMPTY:
// CHECK-NEXT: define private i256 @f_9() !dbg !22 {
// CHECK-NEXT:   ret i256 42, !dbg !23
// CHECK-NEXT: }
// CHECK-EMPTY:
// CHECK-NEXT: ; Function Attrs: nounwind readnone
// CHECK-NEXT: declare i256 @llvm.eravm.getu128() #0
// CHECK-EMPTY:
// CHECK-NEXT: ; Function Attrs: argmemonly nocallback nofree nounwind willreturn
// CHECK-NEXT: declare void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) noalias nocapture writeonly, ptr addrspace(3) noalias nocapture readonly, i256, i1 immarg) #1
// CHECK-EMPTY:
// CHECK-NEXT: attributes #0 = { nounwind readnone }
// CHECK-NEXT: attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
// CHECK-EMPTY:
// CHECK-NEXT: !llvm.dbg.cu = !{!0}
// CHECK-NEXT: !llvm.module.flags = !{!2}
// CHECK-EMPTY:
// CHECK-NEXT: !0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
// CHECK-NEXT: !1 = !DIFile(filename: {{.*}}, directory: {{.*}})
// CHECK-NEXT: !2 = !{i32 2, !"Debug Info Version", i32 3}
// CHECK-NEXT: !3 = distinct !DISubprogram(name: ".unreachable", linkageName: ".unreachable", scope: null, file: !4, type: !5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
// CHECK-NEXT: !4 = !DIFile(filename: {{.*}}, directory: {{.*}})
// CHECK-NEXT: !5 = !DISubroutineType(types: !6)
// CHECK-NEXT: !6 = !{}
// CHECK-NEXT: !7 = !DILocation(line: 6, scope: !8)
// CHECK-NEXT: !8 = !DILexicalBlockFile(scope: !3, file: !9, discriminator: 0)
// CHECK-NEXT: !9 = !DIFile(filename: {{.*}}, directory: {{.*}})
// CHECK-NEXT: !10 = distinct !DISubprogram(name: "__deploy", linkageName: "__deploy", scope: null, file: !4, type: !5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
// CHECK-NEXT: !11 = !DILocation(line: 6, scope: !12)
// CHECK-NEXT: !12 = !DILexicalBlockFile(scope: !10, file: !9, discriminator: 0)
// CHECK-NEXT: !13 = distinct !DISubprogram(name: "__runtime", linkageName: "__runtime", scope: null, file: !4, type: !5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
// CHECK-NEXT: !14 = !DILocation(line: 6, scope: !15)
// CHECK-NEXT: !15 = !DILexicalBlockFile(scope: !13, file: !9, discriminator: 0)
// CHECK-NEXT: !16 = distinct !DISubprogram(name: "__entry", linkageName: "__entry", scope: null, file: !4, type: !5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
// CHECK-NEXT: !17 = !DILocation(line: 6, scope: !18)
// CHECK-NEXT: !18 = !DILexicalBlockFile(scope: !16, file: !9, discriminator: 0)
// CHECK-NEXT: !19 = distinct !DISubprogram(name: "f_9.0", linkageName: "f_9.0", scope: null, file: !9, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
// CHECK-NEXT: !20 = !DILocation(line: 7, column: 43, scope: !21)
// CHECK-NEXT: !21 = !DILexicalBlockFile(scope: !19, file: !9, discriminator: 0)
// CHECK-NEXT: !22 = distinct !DISubprogram(name: "f_9", linkageName: "f_9", scope: null, file: !9, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
// CHECK-NEXT: !23 = !DILocation(line: 7, column: 43, scope: !24)
// CHECK-NEXT: !24 = !DILexicalBlockFile(scope: !22, file: !9, discriminator: 0)
// CHECK-EMPTY:
// ASM: 	.text
// ASM-NEXT: 	.file	{{.*}}
// ASM-NEXT: .unreachable:
// ASM-NEXT: .func_begin0:
// ASM-NEXT: .func_end0:
// ASM-EMPTY:
// ASM-NEXT: __deploy:
// ASM-NEXT: .func_begin1:
// ASM-NEXT: 	.file	{{.*}}
// ASM-NEXT: 	.loc	1 0 0
// ASM-NEXT: 	add	128, r0, r1
// ASM-NEXT: .tmp0:
// ASM-NEXT: 	.file	{{.*}}
// ASM-NEXT: 	.loc	2 6 0 prologue_end
// ASM-NEXT: 	st.1	64, r1
// ASM-NEXT: 	context.get_context_u128	r1
// ASM-NEXT: 	sub!	r1, r0, r1
// ASM-NEXT: 	jump.eq	@.BB1_2
// ASM-NEXT: 	.loc	2 0 0 is_stmt 0
// ASM-NEXT: 	add	2, r0, r3
// ASM-NEXT: 	.loc	2 6 0
// ASM-NEXT: 	add	r0, r0, r1
// ASM-NEXT: 	add	r0, r0, r2
// ASM-NEXT: 	near_call	r0, @__revert, @DEFAULT_UNWIND
// ASM-NEXT: 	near_call	r0, @.unreachable, @DEFAULT_UNWIND
// ASM-NEXT: .BB1_2:
// ASM-NEXT: 	.loc	2 0 0
// ASM-NEXT: 	add	32, r0, r1
// ASM-NEXT: 	.loc	2 6 0
// ASM-NEXT: 	st.2	256, r1
// ASM-NEXT: 	st.2	288, r0
// ASM-NEXT: 	add	256, r0, r1
// ASM-NEXT: 	add	64, r0, r2
// ASM-NEXT: 	add	2, r0, r3
// ASM-NEXT: 	near_call	r0, @__return, @DEFAULT_UNWIND
// ASM-NEXT: 	near_call	r0, @.unreachable, @DEFAULT_UNWIND
// ASM-NEXT: .tmp1:
// ASM-NEXT: .func_end1:
// ASM-EMPTY:
// ASM-NEXT: __runtime:
// ASM-NEXT: .func_begin2:
// ASM-NEXT: 	.loc	1 0 0 is_stmt 1
// ASM-NEXT: 	add	128, r0, r1
// ASM-NEXT: .tmp2:
// ASM-NEXT: 	.loc	2 6 0 prologue_end
// ASM-NEXT: 	st.1	64, r1
// ASM-NEXT: 	add	stack[@calldatasize], r0, r1
// ASM-NEXT: 	sub.s!	4, r1, r1
// ASM-NEXT: 	jump.lt	@.BB2_5
// ASM-NEXT: 	ptr.add	stack[@ptr_calldata], r0, r1
// ASM-NEXT: 	ld	r1, r1
// ASM-NEXT: 	sub.s!	@CPI2_0[0], r1, r1
// ASM-NEXT: 	jump.ne	@.BB2_5
// ASM-NEXT: 	context.get_context_u128	r1
// ASM-NEXT: 	sub!	r1, r0, r1
// ASM-NEXT: 	jump.eq	@.BB2_4
// ASM-NEXT: 	add	r0, r0, r1
// ASM-NEXT: 	add	r0, r0, r2
// ASM-NEXT: 	add	r0, r0, r3
// ASM-NEXT: 	near_call	r0, @__revert, @DEFAULT_UNWIND
// ASM-NEXT: 	near_call	r0, @.unreachable, @DEFAULT_UNWIND
// ASM-NEXT: .BB2_4:
// ASM-NEXT: 	near_call	r0, @f_9, @DEFAULT_UNWIND
// ASM-NEXT: 	ld.1	64, r3
// ASM-NEXT: 	st.1	r3, r1
// ASM-NEXT: 	add	32, r0, r2
// ASM-NEXT: 	add	r3, r0, r1
// ASM-NEXT: 	add	r0, r0, r3
// ASM-NEXT: 	near_call	r0, @__return, @DEFAULT_UNWIND
// ASM-NEXT: 	near_call	r0, @.unreachable, @DEFAULT_UNWIND
// ASM-NEXT: .BB2_5:
// ASM-NEXT: 	add	r0, r0, r1
// ASM-NEXT: 	add	r0, r0, r2
// ASM-NEXT: 	add	r0, r0, r3
// ASM-NEXT: 	near_call	r0, @__revert, @DEFAULT_UNWIND
// ASM-NEXT: 	near_call	r0, @.unreachable, @DEFAULT_UNWIND
// ASM-NEXT: .tmp3:
// ASM-NEXT: .func_end2:
// ASM-EMPTY:
// ASM-NEXT: 	.globl	__entry
// ASM-NEXT: __entry:
// ASM-NEXT: .func_begin3:
// ASM-NEXT: 	.loc	1 0 0
// ASM-NEXT: 	.loc	2 6 0 prologue_end
// ASM-NEXT: 	add	stack[0], r0, r13
// ASM-NEXT: 	shr.s	96, r13, r13
// ASM-NEXT: 	and	@CPI3_0[0], r13, r14
// ASM-NEXT: 	ptr.add	r1, r14, stack[@ptr_return_data]
// ASM-NEXT: 	ptr.add	r1, r14, stack[@ptr_active]
// ASM-NEXT: 	add	r3, r0, stack[@extra_abi_data]
// ASM-NEXT: 	add	r4, r0, stack[@extra_abi_data+1]
// ASM-NEXT: 	add	r5, r0, stack[@extra_abi_data+2]
// ASM-NEXT: 	add	r6, r0, stack[@extra_abi_data+3]
// ASM-NEXT: 	add	r7, r0, stack[@extra_abi_data+4]
// ASM-NEXT: 	add	r8, r0, stack[@extra_abi_data+5]
// ASM-NEXT: 	add	r9, r0, stack[@extra_abi_data+6]
// ASM-NEXT: 	add	r10, r0, stack[@extra_abi_data+7]
// ASM-NEXT: 	add	r11, r0, stack[@extra_abi_data+8]
// ASM-NEXT: 	add	r12, r0, stack[@extra_abi_data+9]
// ASM-NEXT: 	ptr.add	r1, r0, stack[@ptr_calldata]
// ASM-NEXT: 	and	@CPI3_0[0], r13, stack[@calldatasize]
// ASM-NEXT: 	add	r2, r0, stack[@call_flags]
// ASM-NEXT: 	add	0, r0, stack[@memory_pointer]
// ASM-NEXT: 	add	0, r0, stack[@returndatasize]
// ASM-NEXT: 	and!	1, r2, r1
// ASM-NEXT: 	jump.eq	@.BB3_2
// ASM-NEXT: 	near_call	r0, @__deploy, @DEFAULT_UNWIND
// ASM-NEXT: .BB3_2:
// ASM-NEXT: 	near_call	r0, @__runtime, @DEFAULT_UNWIND
// ASM-NEXT: .tmp4:
// ASM-NEXT: .func_end3:
// ASM-EMPTY:
// ASM-NEXT: f_9:
// ASM-NEXT: .func_begin4:
// ASM-NEXT: 	.loc	2 7 0
// ASM-NEXT: 	add	42, r0, r1
// ASM-NEXT: .tmp5:
// ASM-NEXT: 	.loc	2 7 43 prologue_end
// ASM-NEXT: 	ret
// ASM-NEXT: .tmp6:
// ASM-NEXT: .func_end4:
// ASM-EMPTY:
// ASM-NEXT: 	.data
// ASM-NEXT: 	.p2align	5
// ASM-NEXT: ptr_active:
// ASM-NEXT: 	.zero	32
// ASM-EMPTY:
// ASM-NEXT: 	.p2align	5
// ASM-NEXT: ptr_return_data:
// ASM-NEXT: 	.zero	32
// ASM-EMPTY:
// ASM-NEXT: 	.p2align	5
// ASM-NEXT: ptr_calldata:
// ASM-NEXT: 	.zero	32
// ASM-EMPTY:
// ASM-NEXT: 	.p2align	5
// ASM-NEXT: extra_abi_data:
// ASM-NEXT: 	.zero	320
// ASM-EMPTY:
// ASM-NEXT: 	.p2align	5
// ASM-NEXT: call_flags:
// ASM-NEXT: 	.cell 0
// ASM-EMPTY:
// ASM-NEXT: 	.p2align	5
// ASM-NEXT: returndatasize:
// ASM-NEXT: 	.cell 0
// ASM-EMPTY:
// ASM-NEXT: 	.p2align	5
// ASM-NEXT: calldatasize:
// ASM-NEXT: 	.cell 0
// ASM-EMPTY:
// ASM-NEXT: 	.p2align	5
// ASM-NEXT: memory_pointer:
// ASM-NEXT: 	.cell 0
// ASM-EMPTY:
// ASM-NEXT: 	.debug_abbrev
// ASM-NEXT: 	.byte	1
// ASM-NEXT: 	.byte	17
// ASM-NEXT: 	.byte	1
// ASM-NEXT: 	.byte	37
// ASM-NEXT: 	.byte	14
// ASM-NEXT: 	.byte	19
// ASM-NEXT: 	.byte	5
// ASM-NEXT: 	.byte	3
// ASM-NEXT: 	.byte	14
// ASM-NEXT: 	.byte	16
// ASM-NEXT: 	.byte	23
// ASM-NEXT: 	.byte	27
// ASM-NEXT: 	.byte	14
// ASM-NEXT: 	.ascii	"\264B"
// ASM-NEXT: 	.byte	25
// ASM-NEXT: 	.byte	17
// ASM-NEXT: 	.byte	1
// ASM-NEXT: 	.byte	18
// ASM-NEXT: 	.byte	6
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.byte	2
// ASM-NEXT: 	.byte	46
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.byte	17
// ASM-NEXT: 	.byte	1
// ASM-NEXT: 	.byte	18
// ASM-NEXT: 	.byte	6
// ASM-NEXT: 	.byte	110
// ASM-NEXT: 	.byte	14
// ASM-NEXT: 	.byte	3
// ASM-NEXT: 	.byte	14
// ASM-NEXT: 	.byte	63
// ASM-NEXT: 	.byte	25
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.byte	3
// ASM-NEXT: 	.byte	46
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.byte	17
// ASM-NEXT: 	.byte	1
// ASM-NEXT: 	.byte	18
// ASM-NEXT: 	.byte	6
// ASM-NEXT: 	.byte	110
// ASM-NEXT: 	.byte	14
// ASM-NEXT: 	.byte	3
// ASM-NEXT: 	.byte	14
// ASM-NEXT: 	.byte	58
// ASM-NEXT: 	.byte	11
// ASM-NEXT: 	.byte	59
// ASM-NEXT: 	.byte	11
// ASM-NEXT: 	.byte	63
// ASM-NEXT: 	.byte	25
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.byte	0
// ASM-NEXT: 	.debug_info
// ASM-NEXT: .cu_begin0:
// ASM-NEXT: 	.long	@.debug_info_end0-@.debug_info_start0
// ASM-NEXT: .debug_info_start0:
// ASM-NEXT: 	.short	4
// ASM-NEXT: 	.long	@.debug_abbrev
// ASM-NEXT: 	.byte	4
// ASM-NEXT: 	.byte	1
// ASM-NEXT: 	.long	@.info_string0
// ASM-NEXT: 	.short	2
// ASM-NEXT: 	.long	@.info_string1
// ASM-NEXT: 	.long	@.line_table_start0
// ASM-NEXT: 	.long	@.info_string2
// ASM-EMPTY:
// ASM-NEXT: .cell	@.func_begin0
// ASM-NEXT: 	.long	@.func_end4-@.func_begin0
// ASM-NEXT: 	.byte	2
// ASM-NEXT: .cell	@.func_begin0
// ASM-NEXT: 	.long	@.func_end0-@.func_begin0
// ASM-NEXT: 	.long	@.info_string3
// ASM-NEXT: 	.long	@.info_string3
// ASM-EMPTY:
// ASM-NEXT: 	.byte	2
// ASM-NEXT: .cell	@.func_begin1
// ASM-NEXT: 	.long	@.func_end1-@.func_begin1
// ASM-NEXT: 	.long	@.info_string4
// ASM-NEXT: 	.long	@.info_string4
// ASM-EMPTY:
// ASM-NEXT: 	.byte	2
// ASM-NEXT: .cell	@.func_begin2
// ASM-NEXT: 	.long	@.func_end2-@.func_begin2
// ASM-NEXT: 	.long	@.info_string5
// ASM-NEXT: 	.long	@.info_string5
// ASM-EMPTY:
// ASM-NEXT: 	.byte	2
// ASM-NEXT: .cell	@.func_begin3
// ASM-NEXT: 	.long	@.func_end3-@.func_begin3
// ASM-NEXT: 	.long	@.info_string6
// ASM-NEXT: 	.long	@.info_string6
// ASM-EMPTY:
// ASM-NEXT: 	.byte	3
// ASM-NEXT: .cell	@.func_begin4
// ASM-NEXT: 	.long	@.func_end4-@.func_begin4
// ASM-NEXT: 	.long	@.info_string7
// ASM-NEXT: 	.long	@.info_string7
// ASM-NEXT: 	.byte	2
// ASM-NEXT: 	.byte	7
// ASM-EMPTY:
// ASM-NEXT: 	.byte	0
// ASM-NEXT: .debug_info_end0:
// ASM-NEXT: 	.debug_str
// ASM-NEXT: .info_string0:
// ASM-NEXT: 	.asciz	"mlir"
// ASM-NEXT: .info_string1:
// ASM-NEXT: 	.asciz	"LLVMDialectModule"
// ASM-NEXT: .info_string2:
// ASM-NEXT: 	.asciz	"/"
// ASM-NEXT: .info_string3:
// ASM-NEXT: 	.asciz	".unreachable"
// ASM-NEXT: .info_string4:
// ASM-NEXT: 	.asciz	"__deploy"
// ASM-NEXT: .info_string5:
// ASM-NEXT: 	.asciz	"__runtime"
// ASM-NEXT: .info_string6:
// ASM-NEXT: 	.asciz	"__entry"
// ASM-NEXT: .info_string7:
// ASM-NEXT: 	.asciz	"f_9"
// ASM-NEXT: 	.debug_pubnames
// ASM-NEXT: 	.long	@.pubNames_end0-@.pubNames_start0
// ASM-NEXT: .pubNames_start0:
// ASM-NEXT: 	.short	2
// ASM-NEXT: 	.long	@.cu_begin0
// ASM-NEXT: 	.long	294
// ASM-NEXT: 	.long	201
// ASM-NEXT: 	.asciz	"__entry"
// ASM-NEXT: 	.long	156
// ASM-NEXT: 	.asciz	"__runtime"
// ASM-NEXT: 	.long	66
// ASM-NEXT: 	.asciz	".unreachable"
// ASM-NEXT: 	.long	111
// ASM-NEXT: 	.asciz	"__deploy"
// ASM-NEXT: 	.long	246
// ASM-NEXT: 	.asciz	"f_9"
// ASM-NEXT: 	.long	0
// ASM-NEXT: .pubNames_end0:
// ASM-NEXT: 	.debug_pubtypes
// ASM-NEXT: 	.long	@.pubTypes_end0-@.pubTypes_start0
// ASM-NEXT: .pubTypes_start0:
// ASM-NEXT: 	.short	2
// ASM-NEXT: 	.long	@.cu_begin0
// ASM-NEXT: 	.long	294
// ASM-NEXT: 	.long	0
// ASM-NEXT: .pubTypes_end0:
// ASM-NEXT: 	.note.GNU-stack
// ASM-NEXT: 	.rodata
// ASM-NEXT: CPI2_0:
// ASM-NEXT: 	.cell 638722032
// ASM-NEXT: CPI3_0:
// ASM-NEXT: 	.cell 4294967295
// ASM-NEXT: 	.debug_line
// ASM-NEXT: .line_table_start0:
// ASM-EMPTY:
