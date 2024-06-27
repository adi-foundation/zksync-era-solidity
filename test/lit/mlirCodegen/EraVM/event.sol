// RUN: solc --mlir-action=print-std-mlir --mlir-target=eravm --mmlir --mlir-print-debuginfo %s | FileCheck %s

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
  event E(address indexed a, address indexed b, uint256 c);
  function f(address a, address b, uint256 c) public {
    emit E(a, b, c);
  }
}

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: #loc2 = loc({{.*}}:5:0)
// CHECK-NEXT: #loc4 = loc({{.*}}:7:13)
// CHECK-NEXT: #loc5 = loc({{.*}}:7:24)
// CHECK-NEXT: #loc6 = loc({{.*}}:7:35)
// CHECK-NEXT: module {
// CHECK-NEXT:   func.func private @__return(i256, i256, i256) attributes {llvm.linkage = #llvm.linkage<external>} loc(#loc)
// CHECK-NEXT:   func.func private @".unreachable"() attributes {llvm.linkage = #llvm.linkage<private>} {
// CHECK-NEXT:     llvm.unreachable loc(#loc1)
// CHECK-NEXT:   } loc(#loc)
// CHECK-NEXT:   func.func private @__revert(i256, i256, i256) attributes {llvm.linkage = #llvm.linkage<external>} loc(#loc)
// CHECK-NEXT:   func.func private @__farcall(i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256) -> (!llvm.ptr<3>, i1) attributes {llvm.linkage = #llvm.linkage<external>} loc(#loc)
// CHECK-NEXT:   func.func private @__deploy() attributes {llvm.linkage = #llvm.linkage<private>} {
// CHECK-NEXT:     %c128_i256 = arith.constant 128 : i256 loc(#loc2)
// CHECK-NEXT:     %c64_i256 = arith.constant 64 : i256 loc(#loc2)
// CHECK-NEXT:     %0 = llvm.inttoptr %c64_i256 : i256 to !llvm.ptr<1> loc(#loc2)
// CHECK-NEXT:     llvm.store %c128_i256, %0 {alignment = 1 : i64} : i256, !llvm.ptr<1> loc(#loc2)
// CHECK-NEXT:     %1 = "llvm.intrcall"() <{id = 3177 : i32, name = "eravm.getu128"}> : () -> i256 loc(#loc2)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %2 = arith.cmpi ne, %1, %c0_i256 : i256 loc(#loc2)
// CHECK-NEXT:     scf.if %2 {
// CHECK-NEXT:       %c0_i256_8 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:       %c0_i256_9 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:       %c2_i256_10 = arith.constant 2 : i256 loc(#loc2)
// CHECK-NEXT:       func.call @__revert(%c0_i256_8, %c0_i256_9, %c2_i256_10) : (i256, i256, i256) -> () loc(#loc2)
// CHECK-NEXT:       func.call @".unreachable"() : () -> () loc(#loc2)
// CHECK-NEXT:     } loc(#loc2)
// CHECK-NEXT:     %c64_i256_0 = arith.constant 64 : i256 loc(#loc2)
// CHECK-NEXT:     %3 = llvm.inttoptr %c64_i256_0 : i256 to !llvm.ptr<1> loc(#loc2)
// CHECK-NEXT:     %4 = llvm.load %3 {alignment = 1 : i64} : !llvm.ptr<1> -> i256 loc(#loc2)
// CHECK-NEXT:     %c0_i256_1 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c0_i256_2 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %5 = llvm.inttoptr %4 : i256 to !llvm.ptr<1> loc(#loc2)
// CHECK-NEXT:     %6 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:     %7 = llvm.load %6 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:     %8 = llvm.getelementptr %7[%c0_i256_1] : (!llvm.ptr<3>, i256) -> !llvm.ptr<3>, i8 loc(#loc2)
// CHECK-NEXT:     "llvm.intr.memcpy"(%5, %8, %c0_i256_2) <{isVolatile = false}> : (!llvm.ptr<1>, !llvm.ptr<3>, i256) -> () loc(#loc2)
// CHECK-NEXT:     %c256_i256 = arith.constant 256 : i256 loc(#loc2)
// CHECK-NEXT:     %9 = llvm.inttoptr %c256_i256 : i256 to !llvm.ptr<2> loc(#loc2)
// CHECK-NEXT:     %c32_i256 = arith.constant 32 : i256 loc(#loc2)
// CHECK-NEXT:     llvm.store %c32_i256, %9 {alignment = 1 : i64} : i256, !llvm.ptr<2> loc(#loc2)
// CHECK-NEXT:     %c288_i256 = arith.constant 288 : i256 loc(#loc2)
// CHECK-NEXT:     %10 = llvm.inttoptr %c288_i256 : i256 to !llvm.ptr<2> loc(#loc2)
// CHECK-NEXT:     %c0_i256_3 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     llvm.store %c0_i256_3, %10 {alignment = 1 : i64} : i256, !llvm.ptr<2> loc(#loc2)
// CHECK-NEXT:     %c0_i256_4 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c2_i256 = arith.constant 2 : i256 loc(#loc2)
// CHECK-NEXT:     %11 = arith.muli %c0_i256_4, %c2_i256 : i256 loc(#loc2)
// CHECK-NEXT:     %c64_i256_5 = arith.constant 64 : i256 loc(#loc2)
// CHECK-NEXT:     %12 = arith.addi %11, %c64_i256_5 : i256 loc(#loc2)
// CHECK-NEXT:     %c256_i256_6 = arith.constant 256 : i256 loc(#loc2)
// CHECK-NEXT:     %c2_i256_7 = arith.constant 2 : i256 loc(#loc2)
// CHECK-NEXT:     call @__return(%c256_i256_6, %12, %c2_i256_7) : (i256, i256, i256) -> () loc(#loc2)
// CHECK-NEXT:     call @".unreachable"() : () -> () loc(#loc2)
// CHECK-NEXT:     llvm.unreachable loc(#loc2)
// CHECK-NEXT:   } loc(#loc)
// CHECK-NEXT:   func.func private @__runtime() attributes {llvm.linkage = #llvm.linkage<private>, runtime} {
// CHECK-NEXT:     %c128_i256 = arith.constant 128 : i256 loc(#loc2)
// CHECK-NEXT:     %c64_i256 = arith.constant 64 : i256 loc(#loc2)
// CHECK-NEXT:     %0 = llvm.inttoptr %c64_i256 : i256 to !llvm.ptr<1> loc(#loc2)
// CHECK-NEXT:     llvm.store %c128_i256, %0 {alignment = 1 : i64} : i256, !llvm.ptr<1> loc(#loc2)
// CHECK-NEXT:     %1 = llvm.mlir.addressof @calldatasize : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %2 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %c4_i256 = arith.constant 4 : i256 loc(#loc2)
// CHECK-NEXT:     %3 = arith.cmpi uge, %2, %c4_i256 : i256 loc(#loc2)
// CHECK-NEXT:     scf.if %3 {
// CHECK-NEXT:       %c0_i256_2 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:       %4 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:       %5 = llvm.load %4 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:       %6 = llvm.getelementptr %5[%c0_i256_2] : (!llvm.ptr<3>, i256) -> !llvm.ptr<3>, i8 loc(#loc2)
// CHECK-NEXT:       %7 = llvm.load %6 {alignment = 1 : i64} : !llvm.ptr<3> -> i256 loc(#loc2)
// CHECK-NEXT:       scf.int_switch %7 : i256
// CHECK-NEXT:       case 2504580236 {
// CHECK-NEXT:         %8 = "llvm.intrcall"() <{id = 3177 : i32, name = "eravm.getu128"}> : () -> i256 loc(#loc2)
// CHECK-NEXT:         %c0_i256_3 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:         %9 = arith.cmpi ne, %8, %c0_i256_3 : i256 loc(#loc2)
// CHECK-NEXT:         scf.if %9 {
// CHECK-NEXT:           %c0_i256_10 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:           %c0_i256_11 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:           %c0_i256_12 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:           func.call @__revert(%c0_i256_10, %c0_i256_11, %c0_i256_12) : (i256, i256, i256) -> () loc(#loc2)
// CHECK-NEXT:           func.call @".unreachable"() : () -> () loc(#loc2)
// CHECK-NEXT:         } loc(#loc2)
// CHECK-NEXT:         %c4_i256_4 = arith.constant 4 : i256 loc(#loc2)
// CHECK-NEXT:         %c0_i256_5 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:         %10 = arith.addi %c4_i256_4, %c0_i256_5 : i256 loc(#loc2)
// CHECK-NEXT:         %11 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:         %12 = llvm.load %11 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:         %13 = llvm.getelementptr %12[%10] : (!llvm.ptr<3>, i256) -> !llvm.ptr<3>, i8 loc(#loc2)
// CHECK-NEXT:         %14 = llvm.load %13 {alignment = 1 : i64} : !llvm.ptr<3> -> i256 loc(#loc2)
// CHECK-NEXT:         %c32_i256 = arith.constant 32 : i256 loc(#loc2)
// CHECK-NEXT:         %15 = arith.addi %c4_i256_4, %c32_i256 : i256 loc(#loc2)
// CHECK-NEXT:         %16 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:         %17 = llvm.load %16 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:         %18 = llvm.getelementptr %17[%15] : (!llvm.ptr<3>, i256) -> !llvm.ptr<3>, i8 loc(#loc2)
// CHECK-NEXT:         %19 = llvm.load %18 {alignment = 1 : i64} : !llvm.ptr<3> -> i256 loc(#loc2)
// CHECK-NEXT:         %c64_i256_6 = arith.constant 64 : i256 loc(#loc2)
// CHECK-NEXT:         %20 = arith.addi %c4_i256_4, %c64_i256_6 : i256 loc(#loc2)
// CHECK-NEXT:         %21 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:         %22 = llvm.load %21 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:         %23 = llvm.getelementptr %22[%20] : (!llvm.ptr<3>, i256) -> !llvm.ptr<3>, i8 loc(#loc2)
// CHECK-NEXT:         %24 = llvm.load %23 {alignment = 1 : i64} : !llvm.ptr<3> -> i256 loc(#loc2)
// CHECK-NEXT:         func.call @f_25(%14, %19, %24) : (i256, i256, i256) -> () loc(#loc2)
// CHECK-NEXT:         %c64_i256_7 = arith.constant 64 : i256 loc(#loc2)
// CHECK-NEXT:         %25 = llvm.inttoptr %c64_i256_7 : i256 to !llvm.ptr<1> loc(#loc2)
// CHECK-NEXT:         %26 = llvm.load %25 {alignment = 1 : i64} : !llvm.ptr<1> -> i256 loc(#loc2)
// CHECK-NEXT:         %c0_i256_8 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:         %c0_i256_9 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:         func.call @__return(%26, %c0_i256_8, %c0_i256_9) : (i256, i256, i256) -> () loc(#loc2)
// CHECK-NEXT:         func.call @".unreachable"() : () -> () loc(#loc2)
// CHECK-NEXT:         scf.yield loc(#loc2)
// CHECK-NEXT:       }
// CHECK-NEXT:       default {
// CHECK-NEXT:         scf.yield loc(#loc2)
// CHECK-NEXT:       } loc(#loc2)
// CHECK-NEXT:     } loc(#loc2)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c0_i256_0 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c0_i256_1 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     call @__revert(%c0_i256, %c0_i256_0, %c0_i256_1) : (i256, i256, i256) -> () loc(#loc2)
// CHECK-NEXT:     call @".unreachable"() : () -> () loc(#loc2)
// CHECK-NEXT:     llvm.unreachable loc(#loc2)
// CHECK-NEXT:   } loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @ptr_active() {addr_space = 0 : i32} : !llvm.ptr<3> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @ptr_return_data() {addr_space = 0 : i32} : !llvm.ptr<3> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @ptr_calldata() {addr_space = 0 : i32} : !llvm.ptr<3> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @extra_abi_data(dense<0> : tensor<10xi256>) {addr_space = 0 : i32, alignment = 32 : i64} : !llvm.array<10 x i256> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @call_flags(0 : i256) {addr_space = 0 : i32, alignment = 32 : i64} : i256 loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @returndatasize(0 : i256) {addr_space = 0 : i32, alignment = 32 : i64} : i256 loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @calldatasize(0 : i256) {addr_space = 0 : i32, alignment = 32 : i64} : i256 loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @memory_pointer(0 : i256) {addr_space = 0 : i32, alignment = 32 : i64} : i256 loc(#loc)
// CHECK-NEXT:   func.func private @__entry(%arg0: !llvm.ptr<3> loc({{.*}}:5:0), %arg1: i256 loc({{.*}}:5:0), %arg2: i256 loc({{.*}}:5:0), %arg3: i256 loc({{.*}}:5:0), %arg4: i256 loc({{.*}}:5:0), %arg5: i256 loc({{.*}}:5:0), %arg6: i256 loc({{.*}}:5:0), %arg7: i256 loc({{.*}}:5:0), %arg8: i256 loc({{.*}}:5:0), %arg9: i256 loc({{.*}}:5:0), %arg10: i256 loc({{.*}}:5:0), %arg11: i256 loc({{.*}}:5:0)) -> i256 attributes {llvm.linkage = #llvm.linkage<external>} {
// CHECK-NEXT:     %0 = llvm.mlir.addressof @memory_pointer : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     llvm.store %c0_i256, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %1 = llvm.mlir.addressof @calldatasize : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %c0_i256_0 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     llvm.store %c0_i256_0, %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %2 = llvm.mlir.addressof @returndatasize : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %c0_i256_1 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     llvm.store %c0_i256_1, %2 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %3 = llvm.mlir.addressof @call_flags : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %c0_i256_2 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     llvm.store %c0_i256_2, %3 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %4 = llvm.mlir.addressof @extra_abi_data : !llvm.ptr<array<10 x i256>> loc(#loc2)
// CHECK-NEXT:     %5 = llvm.mlir.constant(dense<0> : vector<10xi256>) : vector<10xi256> loc(#loc2)
// CHECK-NEXT:     llvm.store %5, %4 : !llvm.ptr<array<10 x i256>> loc(#loc2)
// CHECK-NEXT:     %6 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg0, %6 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:     %7 = llvm.ptrtoint %6 : !llvm.ptr<ptr<3>> to i256 loc(#loc2)
// CHECK-NEXT:     %c96_i256 = arith.constant 96 : i256 loc(#loc2)
// CHECK-NEXT:     %8 = llvm.lshr %7, %c96_i256  : i256 loc(#loc2)
// CHECK-NEXT:     %c4294967295_i256 = arith.constant 4294967295 : i256 loc(#loc2)
// CHECK-NEXT:     %9 = llvm.and %8, %c4294967295_i256  : i256 loc(#loc2)
// CHECK-NEXT:     %10 = llvm.mlir.addressof @calldatasize : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %9, %10 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %11 = llvm.load %10 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %12 = llvm.getelementptr %arg0[%11] : (!llvm.ptr<3>, i256) -> !llvm.ptr, i8 loc(#loc2)
// CHECK-NEXT:     %13 = llvm.mlir.addressof @ptr_return_data : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:     llvm.store %12, %13 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:     %14 = llvm.mlir.addressof @ptr_active : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:     llvm.store %12, %14 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc2)
// CHECK-NEXT:     %15 = llvm.mlir.addressof @call_flags : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg1, %15 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc2)
// CHECK-NEXT:     %16 = llvm.mlir.addressof @extra_abi_data : !llvm.ptr<array<10 x i256>> loc(#loc2)
// CHECK-NEXT:     %c0_i256_3 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c0_i256_4 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %17 = llvm.getelementptr %16[%c0_i256_3, %c0_i256_4] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg2, %17 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_5 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c1_i256 = arith.constant 1 : i256 loc(#loc2)
// CHECK-NEXT:     %18 = llvm.getelementptr %16[%c0_i256_5, %c1_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg3, %18 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_6 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c2_i256 = arith.constant 2 : i256 loc(#loc2)
// CHECK-NEXT:     %19 = llvm.getelementptr %16[%c0_i256_6, %c2_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg4, %19 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_7 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c3_i256 = arith.constant 3 : i256 loc(#loc2)
// CHECK-NEXT:     %20 = llvm.getelementptr %16[%c0_i256_7, %c3_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg5, %20 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_8 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c4_i256 = arith.constant 4 : i256 loc(#loc2)
// CHECK-NEXT:     %21 = llvm.getelementptr %16[%c0_i256_8, %c4_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg6, %21 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_9 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c5_i256 = arith.constant 5 : i256 loc(#loc2)
// CHECK-NEXT:     %22 = llvm.getelementptr %16[%c0_i256_9, %c5_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg7, %22 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_10 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c6_i256 = arith.constant 6 : i256 loc(#loc2)
// CHECK-NEXT:     %23 = llvm.getelementptr %16[%c0_i256_10, %c6_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg8, %23 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_11 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c7_i256 = arith.constant 7 : i256 loc(#loc2)
// CHECK-NEXT:     %24 = llvm.getelementptr %16[%c0_i256_11, %c7_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg9, %24 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_12 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c8_i256 = arith.constant 8 : i256 loc(#loc2)
// CHECK-NEXT:     %25 = llvm.getelementptr %16[%c0_i256_12, %c8_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg10, %25 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c0_i256_13 = arith.constant 0 : i256 loc(#loc2)
// CHECK-NEXT:     %c9_i256 = arith.constant 9 : i256 loc(#loc2)
// CHECK-NEXT:     %26 = llvm.getelementptr %16[%c0_i256_13, %c9_i256] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc2)
// CHECK-NEXT:     llvm.store %arg11, %26 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc2)
// CHECK-NEXT:     %c1_i256_14 = arith.constant 1 : i256 loc(#loc2)
// CHECK-NEXT:     %27 = arith.andi %arg1, %c1_i256_14 : i256 loc(#loc2)
// CHECK-NEXT:     %c1_i256_15 = arith.constant 1 : i256 loc(#loc2)
// CHECK-NEXT:     %28 = arith.cmpi eq, %27, %c1_i256_15 : i256 loc(#loc2)
// CHECK-NEXT:     scf.if %28 {
// CHECK-NEXT:       func.call @__deploy() : () -> () loc(#loc2)
// CHECK-NEXT:     } else {
// CHECK-NEXT:       func.call @__runtime() : () -> () loc(#loc2)
// CHECK-NEXT:     } loc(#loc2)
// CHECK-NEXT:     llvm.unreachable loc(#loc2)
// CHECK-NEXT:   } loc(#loc)
// CHECK-NEXT:   func.func @f_25.0(%arg0: i256 loc({{.*}}:7:13), %arg1: i256 loc({{.*}}:7:24), %arg2: i256 loc({{.*}}:7:35)) attributes {llvm.linkage = #llvm.linkage<private>, state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:     %c1_i256 = arith.constant 1 : i256 loc(#loc4)
// CHECK-NEXT:     %0 = llvm.alloca %c1_i256 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc4)
// CHECK-NEXT:     llvm.store %arg0, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc4)
// CHECK-NEXT:     %c1_i256_0 = arith.constant 1 : i256 loc(#loc5)
// CHECK-NEXT:     %1 = llvm.alloca %c1_i256_0 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc5)
// CHECK-NEXT:     llvm.store %arg1, %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc5)
// CHECK-NEXT:     %c1_i256_1 = arith.constant 1 : i256 loc(#loc6)
// CHECK-NEXT:     %2 = llvm.alloca %c1_i256_1 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc6)
// CHECK-NEXT:     llvm.store %arg2, %2 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc6)
// CHECK-NEXT:     %3 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc7)
// CHECK-NEXT:     %4 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc8)
// CHECK-NEXT:     %5 = llvm.load %2 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc9)
// CHECK-NEXT:     %c64_i256 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:     %6 = llvm.inttoptr %c64_i256 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     %7 = llvm.load %6 {alignment = 1 : i64} : !llvm.ptr<1> -> i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %8 = arith.addi %7, %c0_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %c32_i256 = arith.constant 32 : i256 loc(#loc1)
// CHECK-NEXT:     %9 = arith.addi %7, %c32_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %10 = llvm.inttoptr %8 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     llvm.store %5, %10 {alignment = 1 : i64} : i256, !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     %11 = arith.subi %9, %7 : i256 loc(#loc1)
// CHECK-NEXT:     %c111132197172043982799275756282906274828091953306009223086552617_i256 = arith.constant 111132197172043982799275756282906274828091953306009223086552617 : i256 loc(#loc1)
// CHECK-NEXT:     %c4294967295_i256 = arith.constant 4294967295 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i64 = arith.constant 1 : i64 loc(#loc1)
// CHECK-NEXT:     %12 = llvm.alloca %c1_i64 x i256 {alignment = 32 : i64} : (i64) -> !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %c4294967295_i256, %12 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %13 = arith.cmpi ule, %7, %c4294967295_i256 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %13 {
// CHECK-NEXT:       llvm.store %7, %12 : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     %14 = llvm.load %12 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c4294967295_i256_2 = arith.constant 4294967295 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i64_3 = arith.constant 1 : i64 loc(#loc1)
// CHECK-NEXT:     %15 = llvm.alloca %c1_i64_3 x i256 {alignment = 32 : i64} : (i64) -> !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %c4294967295_i256_2, %15 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %16 = arith.cmpi ule, %11, %c4294967295_i256_2 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %16 {
// CHECK-NEXT:       llvm.store %11, %15 : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     %17 = llvm.load %15 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %18 = "llvm.intrcall"() <{id = 3176 : i32, name = "eravm.gasleft"}> : () -> i256 loc(#loc1)
// CHECK-NEXT:     %c4294967295_i256_4 = arith.constant 4294967295 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i64_5 = arith.constant 1 : i64 loc(#loc1)
// CHECK-NEXT:     %19 = llvm.alloca %c1_i64_5 x i256 {alignment = 32 : i64} : (i64) -> !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %c4294967295_i256_4, %19 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %20 = arith.cmpi ule, %18, %c4294967295_i256_4 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %20 {
// CHECK-NEXT:       llvm.store %18, %19 : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     %21 = llvm.load %19 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c64_i256_6 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:     %22 = arith.shli %14, %c64_i256_6 : i256 loc(#loc1)
// CHECK-NEXT:     %c96_i256 = arith.constant 96 : i256 loc(#loc1)
// CHECK-NEXT:     %23 = arith.shli %17, %c96_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %c192_i256 = arith.constant 192 : i256 loc(#loc1)
// CHECK-NEXT:     %24 = arith.shli %21, %c192_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %25 = arith.addi %22, %23 : i256 loc(#loc1)
// CHECK-NEXT:     %26 = arith.addi %25, %24 : i256 loc(#loc1)
// CHECK-NEXT:     %c904625697166532776746648320380374280103671755200316906558262375061821325312_i256 = arith.constant 904625697166532776746648320380374280103671755200316906558262375061821325312 : i256 loc(#loc1)
// CHECK-NEXT:     %27 = arith.addi %26, %c904625697166532776746648320380374280103671755200316906558262375061821325312_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %c32781_i256 = arith.constant 32781 : i256 loc(#loc1)
// CHECK-NEXT:     %c3_i256 = arith.constant 3 : i256 loc(#loc1)
// CHECK-NEXT:     %28 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %29 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %30 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %31 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %32 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %33 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %34:2 = call @__farcall(%27, %c32781_i256, %c3_i256, %c111132197172043982799275756282906274828091953306009223086552617_i256, %3, %4, %28, %29, %30, %31, %32, %33) : (i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256) -> (!llvm.ptr<3>, i1) loc(#loc1)
// CHECK-NEXT:     %false = arith.constant false loc(#loc1)
// CHECK-NEXT:     %35 = arith.cmpi eq, %34#1, %false : i1 loc(#loc1)
// CHECK-NEXT:     scf.if %35 {
// CHECK-NEXT:       %c0_i256_7 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:       %c0_i256_8 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:       %c2_i256 = arith.constant 2 : i256 loc(#loc1)
// CHECK-NEXT:       func.call @__revert(%c0_i256_7, %c0_i256_8, %c2_i256) : (i256, i256, i256) -> () loc(#loc1)
// CHECK-NEXT:       func.call @".unreachable"() : () -> () loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     return loc(#loc3)
// CHECK-NEXT:   } loc(#loc3)
// CHECK-NEXT:   func.func @f_25(%arg0: i256 loc({{.*}}:7:13), %arg1: i256 loc({{.*}}:7:24), %arg2: i256 loc({{.*}}:7:35)) attributes {llvm.linkage = #llvm.linkage<private>, runtime, state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:     %c1_i256 = arith.constant 1 : i256 loc(#loc4)
// CHECK-NEXT:     %0 = llvm.alloca %c1_i256 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc4)
// CHECK-NEXT:     llvm.store %arg0, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc4)
// CHECK-NEXT:     %c1_i256_0 = arith.constant 1 : i256 loc(#loc5)
// CHECK-NEXT:     %1 = llvm.alloca %c1_i256_0 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc5)
// CHECK-NEXT:     llvm.store %arg1, %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc5)
// CHECK-NEXT:     %c1_i256_1 = arith.constant 1 : i256 loc(#loc6)
// CHECK-NEXT:     %2 = llvm.alloca %c1_i256_1 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc6)
// CHECK-NEXT:     llvm.store %arg2, %2 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc6)
// CHECK-NEXT:     %3 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc7)
// CHECK-NEXT:     %4 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc8)
// CHECK-NEXT:     %5 = llvm.load %2 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc9)
// CHECK-NEXT:     %c64_i256 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:     %6 = llvm.inttoptr %c64_i256 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     %7 = llvm.load %6 {alignment = 1 : i64} : !llvm.ptr<1> -> i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %8 = arith.addi %7, %c0_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %c32_i256 = arith.constant 32 : i256 loc(#loc1)
// CHECK-NEXT:     %9 = arith.addi %7, %c32_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %10 = llvm.inttoptr %8 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     llvm.store %5, %10 {alignment = 1 : i64} : i256, !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     %11 = arith.subi %9, %7 : i256 loc(#loc1)
// CHECK-NEXT:     %c111132197172043982799275756282906274828091953306009223086552617_i256 = arith.constant 111132197172043982799275756282906274828091953306009223086552617 : i256 loc(#loc1)
// CHECK-NEXT:     %c4294967295_i256 = arith.constant 4294967295 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i64 = arith.constant 1 : i64 loc(#loc1)
// CHECK-NEXT:     %12 = llvm.alloca %c1_i64 x i256 {alignment = 32 : i64} : (i64) -> !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %c4294967295_i256, %12 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %13 = arith.cmpi ule, %7, %c4294967295_i256 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %13 {
// CHECK-NEXT:       llvm.store %7, %12 : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     %14 = llvm.load %12 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c4294967295_i256_2 = arith.constant 4294967295 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i64_3 = arith.constant 1 : i64 loc(#loc1)
// CHECK-NEXT:     %15 = llvm.alloca %c1_i64_3 x i256 {alignment = 32 : i64} : (i64) -> !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %c4294967295_i256_2, %15 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %16 = arith.cmpi ule, %11, %c4294967295_i256_2 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %16 {
// CHECK-NEXT:       llvm.store %11, %15 : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     %17 = llvm.load %15 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %18 = "llvm.intrcall"() <{id = 3176 : i32, name = "eravm.gasleft"}> : () -> i256 loc(#loc1)
// CHECK-NEXT:     %c4294967295_i256_4 = arith.constant 4294967295 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i64_5 = arith.constant 1 : i64 loc(#loc1)
// CHECK-NEXT:     %19 = llvm.alloca %c1_i64_5 x i256 {alignment = 32 : i64} : (i64) -> !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %c4294967295_i256_4, %19 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %20 = arith.cmpi ule, %18, %c4294967295_i256_4 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %20 {
// CHECK-NEXT:       llvm.store %18, %19 : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     %21 = llvm.load %19 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c64_i256_6 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:     %22 = arith.shli %14, %c64_i256_6 : i256 loc(#loc1)
// CHECK-NEXT:     %c96_i256 = arith.constant 96 : i256 loc(#loc1)
// CHECK-NEXT:     %23 = arith.shli %17, %c96_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %c192_i256 = arith.constant 192 : i256 loc(#loc1)
// CHECK-NEXT:     %24 = arith.shli %21, %c192_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %25 = arith.addi %22, %23 : i256 loc(#loc1)
// CHECK-NEXT:     %26 = arith.addi %25, %24 : i256 loc(#loc1)
// CHECK-NEXT:     %c904625697166532776746648320380374280103671755200316906558262375061821325312_i256 = arith.constant 904625697166532776746648320380374280103671755200316906558262375061821325312 : i256 loc(#loc1)
// CHECK-NEXT:     %27 = arith.addi %26, %c904625697166532776746648320380374280103671755200316906558262375061821325312_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %c32781_i256 = arith.constant 32781 : i256 loc(#loc1)
// CHECK-NEXT:     %c3_i256 = arith.constant 3 : i256 loc(#loc1)
// CHECK-NEXT:     %28 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %29 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %30 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %31 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %32 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %33 = llvm.mlir.undef : i256 loc(#loc1)
// CHECK-NEXT:     %34:2 = call @__farcall(%27, %c32781_i256, %c3_i256, %c111132197172043982799275756282906274828091953306009223086552617_i256, %3, %4, %28, %29, %30, %31, %32, %33) : (i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256) -> (!llvm.ptr<3>, i1) loc(#loc1)
// CHECK-NEXT:     %false = arith.constant false loc(#loc1)
// CHECK-NEXT:     %35 = arith.cmpi eq, %34#1, %false : i1 loc(#loc1)
// CHECK-NEXT:     scf.if %35 {
// CHECK-NEXT:       %c0_i256_7 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:       %c0_i256_8 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:       %c0_i256_9 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:       func.call @__revert(%c0_i256_7, %c0_i256_8, %c0_i256_9) : (i256, i256, i256) -> () loc(#loc1)
// CHECK-NEXT:       func.call @".unreachable"() : () -> () loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     return loc(#loc3)
// CHECK-NEXT:   } loc(#loc3)
// CHECK-NEXT: } loc(#loc)
// CHECK-NEXT: #loc = loc(unknown)
// CHECK-NEXT: #loc1 = loc({{.*}}:8:9)
// CHECK-NEXT: #loc3 = loc({{.*}}:7:2)
// CHECK-NEXT: #loc7 = loc({{.*}}:8:11)
// CHECK-NEXT: #loc8 = loc({{.*}}:8:14)
// CHECK-NEXT: #loc9 = loc({{.*}}:8:17)
// CHECK-EMPTY:
