// RUN: solc --mlir-action=print-std-mlir --mlir-target=eravm --mmlir --mlir-print-debuginfo %s | FileCheck %s

contract C {
  uint m;
  function f(uint a) private {
    m = a;
  }

  function unchk(uint a, uint b) public {
    unchecked {
      a += b;
      a -= b;
      a *= b;

      f(a + b);
      f(a - b);
      f(a * b);
    }
  }
}

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: #loc1 = loc({{.*}}:2:0)
// CHECK-NEXT: #loc3 = loc({{.*}}:8:17)
// CHECK-NEXT: #loc4 = loc({{.*}}:8:25)
// CHECK-NEXT: #loc21 = loc({{.*}}:4:13)
// CHECK-NEXT: module {
// CHECK-NEXT:   func.func private @__return(i256, i256, i256) attributes {llvm.linkage = #llvm.linkage<external>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality} loc(#loc)
// CHECK-NEXT:   func.func private @".unreachable"() attributes {llvm.linkage = #llvm.linkage<private>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality} {
// CHECK-NEXT:     llvm.unreachable loc(#loc1)
// CHECK-NEXT:   } loc(#loc)
// CHECK-NEXT:   func.func private @__revert(i256, i256, i256) attributes {llvm.linkage = #llvm.linkage<external>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality} loc(#loc)
// CHECK-NEXT:   func.func private @__deploy() attributes {llvm.linkage = #llvm.linkage<private>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality} {
// CHECK-NEXT:     %c128_i256 = arith.constant 128 : i256 loc(#loc1)
// CHECK-NEXT:     %c64_i256 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:     %0 = llvm.inttoptr %c64_i256 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     llvm.store %c128_i256, %0 {alignment = 1 : i64} : i256, !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     %1 = "llvm.intrcall"() <{id = 3177 : i32, name = "eravm.getu128"}> : () -> i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %2 = arith.cmpi ne, %1, %c0_i256 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %2 {
// CHECK-NEXT:       %c0_i256_8 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:       %c0_i256_9 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:       %c2_i256_10 = arith.constant 2 : i256 loc(#loc1)
// CHECK-NEXT:       func.call @__revert(%c0_i256_8, %c0_i256_9, %c2_i256_10) : (i256, i256, i256) -> () loc(#loc1)
// CHECK-NEXT:       func.call @".unreachable"() : () -> () loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     %c64_i256_0 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:     %3 = llvm.inttoptr %c64_i256_0 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     %4 = llvm.load %3 {alignment = 1 : i64} : !llvm.ptr<1> -> i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256_1 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256_2 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %5 = llvm.inttoptr %4 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     %6 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:     %7 = llvm.load %6 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:     %8 = llvm.getelementptr %7[%c0_i256_1] : (!llvm.ptr<3>, i256) -> !llvm.ptr<3>, i8 loc(#loc1)
// CHECK-NEXT:     "llvm.intr.memcpy"(%5, %8, %c0_i256_2) <{isVolatile = false}> : (!llvm.ptr<1>, !llvm.ptr<3>, i256) -> () loc(#loc1)
// CHECK-NEXT:     %c256_i256 = arith.constant 256 : i256 loc(#loc1)
// CHECK-NEXT:     %9 = llvm.inttoptr %c256_i256 : i256 to !llvm.ptr<2> loc(#loc1)
// CHECK-NEXT:     %c32_i256 = arith.constant 32 : i256 loc(#loc1)
// CHECK-NEXT:     llvm.store %c32_i256, %9 {alignment = 1 : i64} : i256, !llvm.ptr<2> loc(#loc1)
// CHECK-NEXT:     %c288_i256 = arith.constant 288 : i256 loc(#loc1)
// CHECK-NEXT:     %10 = llvm.inttoptr %c288_i256 : i256 to !llvm.ptr<2> loc(#loc1)
// CHECK-NEXT:     %c0_i256_3 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     llvm.store %c0_i256_3, %10 {alignment = 1 : i64} : i256, !llvm.ptr<2> loc(#loc1)
// CHECK-NEXT:     %c0_i256_4 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c2_i256 = arith.constant 2 : i256 loc(#loc1)
// CHECK-NEXT:     %11 = arith.muli %c0_i256_4, %c2_i256 : i256 loc(#loc1)
// CHECK-NEXT:     %c64_i256_5 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:     %12 = arith.addi %11, %c64_i256_5 : i256 loc(#loc1)
// CHECK-NEXT:     %c256_i256_6 = arith.constant 256 : i256 loc(#loc1)
// CHECK-NEXT:     %c2_i256_7 = arith.constant 2 : i256 loc(#loc1)
// CHECK-NEXT:     call @__return(%c256_i256_6, %12, %c2_i256_7) : (i256, i256, i256) -> () loc(#loc1)
// CHECK-NEXT:     call @".unreachable"() : () -> () loc(#loc1)
// CHECK-NEXT:     llvm.unreachable loc(#loc1)
// CHECK-NEXT:   } loc(#loc)
// CHECK-NEXT:   func.func private @__runtime() attributes {llvm.linkage = #llvm.linkage<private>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality, runtime} {
// CHECK-NEXT:     %c128_i256 = arith.constant 128 : i256 loc(#loc1)
// CHECK-NEXT:     %c64_i256 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:     %0 = llvm.inttoptr %c64_i256 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     llvm.store %c128_i256, %0 {alignment = 1 : i64} : i256, !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:     %1 = llvm.mlir.addressof @calldatasize : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %2 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c4_i256 = arith.constant 4 : i256 loc(#loc1)
// CHECK-NEXT:     %3 = arith.cmpi uge, %2, %c4_i256 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %3 {
// CHECK-NEXT:       %c0_i256_2 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:       %4 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:       %5 = llvm.load %4 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:       %6 = llvm.getelementptr %5[%c0_i256_2] : (!llvm.ptr<3>, i256) -> !llvm.ptr<3>, i8 loc(#loc1)
// CHECK-NEXT:       %7 = llvm.load %6 {alignment = 1 : i64} : !llvm.ptr<3> -> i256 loc(#loc1)
// CHECK-NEXT:       %c224_i256 = arith.constant 224 : i256 loc(#loc1)
// CHECK-NEXT:       %8 = arith.shrui %7, %c224_i256 : i256 loc(#loc1)
// CHECK-NEXT:       %9 = arith.trunci %8 : i256 to i32 loc(#loc1)
// CHECK-NEXT:       scf.int_switch %9 : i32
// CHECK-NEXT:       case -1231012231 {
// CHECK-NEXT:         %10 = "llvm.intrcall"() <{id = 3177 : i32, name = "eravm.getu128"}> : () -> i256 loc(#loc1)
// CHECK-NEXT:         %c0_i256_3 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:         %11 = arith.cmpi ne, %10, %c0_i256_3 : i256 loc(#loc1)
// CHECK-NEXT:         scf.if %11 {
// CHECK-NEXT:           %c0_i256_9 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:           %c0_i256_10 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:           %c0_i256_11 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:           func.call @__revert(%c0_i256_9, %c0_i256_10, %c0_i256_11) : (i256, i256, i256) -> () loc(#loc1)
// CHECK-NEXT:           func.call @".unreachable"() : () -> () loc(#loc1)
// CHECK-NEXT:         } loc(#loc1)
// CHECK-NEXT:         %c4_i256_4 = arith.constant 4 : i256 loc(#loc1)
// CHECK-NEXT:         %12 = arith.subi %2, %c4_i256_4 : i256 loc(#loc1)
// CHECK-NEXT:         %c32_i256 = arith.constant 32 : i256 loc(#loc1)
// CHECK-NEXT:         %13 = arith.cmpi slt, %12, %c32_i256 : i256 loc(#loc1)
// CHECK-NEXT:         scf.if %13 {
// CHECK-NEXT:           %c0_i256_9 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:           %c0_i256_10 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:           func.call @__revert(%c0_i256_9, %c0_i256_9, %c0_i256_10) : (i256, i256, i256) -> () loc(#loc1)
// CHECK-NEXT:           func.call @".unreachable"() : () -> () loc(#loc1)
// CHECK-NEXT:         } loc(#loc1)
// CHECK-NEXT:         %c0_i256_5 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:         %14 = arith.addi %c4_i256_4, %c0_i256_5 : i256 loc(#loc1)
// CHECK-NEXT:         %15 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:         %16 = llvm.load %15 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:         %17 = llvm.getelementptr %16[%14] : (!llvm.ptr<3>, i256) -> !llvm.ptr<3>, i8 loc(#loc1)
// CHECK-NEXT:         %18 = llvm.load %17 {alignment = 1 : i64} : !llvm.ptr<3> -> i256 loc(#loc1)
// CHECK-NEXT:         func.call @f_12(%18) : (i256) -> () loc(#loc1)
// CHECK-NEXT:         %c64_i256_6 = arith.constant 64 : i256 loc(#loc1)
// CHECK-NEXT:         %19 = llvm.inttoptr %c64_i256_6 : i256 to !llvm.ptr<1> loc(#loc1)
// CHECK-NEXT:         %20 = llvm.load %19 {alignment = 1 : i64} : !llvm.ptr<1> -> i256 loc(#loc1)
// CHECK-NEXT:         %c0_i256_7 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:         %c0_i256_8 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:         func.call @__return(%20, %c0_i256_7, %c0_i256_8) : (i256, i256, i256) -> () loc(#loc1)
// CHECK-NEXT:         func.call @".unreachable"() : () -> () loc(#loc1)
// CHECK-NEXT:         scf.yield loc(#loc1)
// CHECK-NEXT:       }
// CHECK-NEXT:       default {
// CHECK-NEXT:         scf.yield loc(#loc1)
// CHECK-NEXT:       } loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256_0 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256_1 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     call @__revert(%c0_i256, %c0_i256_0, %c0_i256_1) : (i256, i256, i256) -> () loc(#loc1)
// CHECK-NEXT:     call @".unreachable"() : () -> () loc(#loc1)
// CHECK-NEXT:     llvm.unreachable loc(#loc1)
// CHECK-NEXT:   } loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @ptr_decommit() {addr_space = 0 : i32} : !llvm.ptr<3> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @ptr_return_data() {addr_space = 0 : i32} : !llvm.ptr<3> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @ptr_calldata() {addr_space = 0 : i32} : !llvm.ptr<3> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @ptr_active() {addr_space = 0 : i32} : !llvm.array<16 x ptr<3>> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @extra_abi_data(dense<0> : tensor<10xi256>) {addr_space = 0 : i32} : !llvm.array<10 x i256> loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @call_flags(0 : i256) {addr_space = 0 : i32} : i256 loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @returndatasize(0 : i256) {addr_space = 0 : i32} : i256 loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @calldatasize(0 : i256) {addr_space = 0 : i32} : i256 loc(#loc)
// CHECK-NEXT:   llvm.mlir.global private @memory_pointer(0 : i256) {addr_space = 0 : i32} : i256 loc(#loc)
// CHECK-NEXT:   func.func private @__entry(%arg0: !llvm.ptr<3> loc({{.*}}:2:0), %arg1: i256 loc({{.*}}:2:0), %arg2: i256 loc({{.*}}:2:0), %arg3: i256 loc({{.*}}:2:0), %arg4: i256 loc({{.*}}:2:0), %arg5: i256 loc({{.*}}:2:0), %arg6: i256 loc({{.*}}:2:0), %arg7: i256 loc({{.*}}:2:0), %arg8: i256 loc({{.*}}:2:0), %arg9: i256 loc({{.*}}:2:0), %arg10: i256 loc({{.*}}:2:0), %arg11: i256 loc({{.*}}:2:0)) -> i256 attributes {llvm.linkage = #llvm.linkage<external>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality} {
// CHECK-NEXT:     %0 = llvm.mlir.addressof @memory_pointer : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     llvm.store %c0_i256, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %1 = llvm.mlir.addressof @calldatasize : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c0_i256_0 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     llvm.store %c0_i256_0, %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %2 = llvm.mlir.addressof @returndatasize : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c0_i256_1 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     llvm.store %c0_i256_1, %2 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %3 = llvm.mlir.addressof @call_flags : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %c0_i256_2 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     llvm.store %c0_i256_2, %3 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %4 = llvm.mlir.addressof @extra_abi_data : !llvm.ptr<array<10 x i256>> loc(#loc1)
// CHECK-NEXT:     %5 = llvm.mlir.constant(dense<0> : vector<10xi256>) : vector<10xi256> loc(#loc1)
// CHECK-NEXT:     llvm.store %5, %4 : !llvm.ptr<array<10 x i256>> loc(#loc1)
// CHECK-NEXT:     %6 = llvm.mlir.addressof @ptr_calldata : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg0, %6 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:     %7 = llvm.ptrtoint %6 : !llvm.ptr<ptr<3>> to i256 loc(#loc1)
// CHECK-NEXT:     %c96_i256 = arith.constant 96 : i256 loc(#loc1)
// CHECK-NEXT:     %8 = llvm.lshr %7, %c96_i256  : i256 loc(#loc1)
// CHECK-NEXT:     %c4294967295_i256 = arith.constant 4294967295 : i256 loc(#loc1)
// CHECK-NEXT:     %9 = llvm.and %8, %c4294967295_i256  : i256 loc(#loc1)
// CHECK-NEXT:     %10 = llvm.mlir.addressof @calldatasize : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %9, %10 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %11 = llvm.load %10 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %12 = llvm.getelementptr %arg0[%11] : (!llvm.ptr<3>, i256) -> !llvm.ptr, i8 loc(#loc1)
// CHECK-NEXT:     %13 = llvm.mlir.addressof @ptr_return_data : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %13 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:     %14 = llvm.mlir.addressof @ptr_decommit : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %14 {alignment = 32 : i64} : !llvm.ptr<ptr<3>> loc(#loc1)
// CHECK-NEXT:     %15 = llvm.mlir.addressof @ptr_active : !llvm.ptr<array<16 x ptr<3>>> loc(#loc1)
// CHECK-NEXT:     %c0_i256_3 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256_4 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %16 = llvm.getelementptr %15[%c0_i256_3, %c0_i256_4] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %16 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_5 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i256 = arith.constant 1 : i256 loc(#loc1)
// CHECK-NEXT:     %17 = llvm.getelementptr %15[%c0_i256_5, %c1_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %17 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_6 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c2_i256 = arith.constant 2 : i256 loc(#loc1)
// CHECK-NEXT:     %18 = llvm.getelementptr %15[%c0_i256_6, %c2_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %18 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_7 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c3_i256 = arith.constant 3 : i256 loc(#loc1)
// CHECK-NEXT:     %19 = llvm.getelementptr %15[%c0_i256_7, %c3_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %19 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_8 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c4_i256 = arith.constant 4 : i256 loc(#loc1)
// CHECK-NEXT:     %20 = llvm.getelementptr %15[%c0_i256_8, %c4_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %20 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_9 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c5_i256 = arith.constant 5 : i256 loc(#loc1)
// CHECK-NEXT:     %21 = llvm.getelementptr %15[%c0_i256_9, %c5_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %21 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_10 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c6_i256 = arith.constant 6 : i256 loc(#loc1)
// CHECK-NEXT:     %22 = llvm.getelementptr %15[%c0_i256_10, %c6_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %22 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_11 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c7_i256 = arith.constant 7 : i256 loc(#loc1)
// CHECK-NEXT:     %23 = llvm.getelementptr %15[%c0_i256_11, %c7_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %23 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_12 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c8_i256 = arith.constant 8 : i256 loc(#loc1)
// CHECK-NEXT:     %24 = llvm.getelementptr %15[%c0_i256_12, %c8_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %24 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_13 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c9_i256 = arith.constant 9 : i256 loc(#loc1)
// CHECK-NEXT:     %25 = llvm.getelementptr %15[%c0_i256_13, %c9_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %25 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_14 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c10_i256 = arith.constant 10 : i256 loc(#loc1)
// CHECK-NEXT:     %26 = llvm.getelementptr %15[%c0_i256_14, %c10_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %26 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_15 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c11_i256 = arith.constant 11 : i256 loc(#loc1)
// CHECK-NEXT:     %27 = llvm.getelementptr %15[%c0_i256_15, %c11_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %27 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_16 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c12_i256 = arith.constant 12 : i256 loc(#loc1)
// CHECK-NEXT:     %28 = llvm.getelementptr %15[%c0_i256_16, %c12_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %28 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_17 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c13_i256 = arith.constant 13 : i256 loc(#loc1)
// CHECK-NEXT:     %29 = llvm.getelementptr %15[%c0_i256_17, %c13_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %29 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_18 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c14_i256 = arith.constant 14 : i256 loc(#loc1)
// CHECK-NEXT:     %30 = llvm.getelementptr %15[%c0_i256_18, %c14_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %30 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %c0_i256_19 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c15_i256 = arith.constant 15 : i256 loc(#loc1)
// CHECK-NEXT:     %31 = llvm.getelementptr %15[%c0_i256_19, %c15_i256] : (!llvm.ptr<array<16 x ptr<3>>>, i256, i256) -> !llvm.ptr<3>, !llvm.array<16 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %12, %31 {alignment = 32 : i64} : !llvm.ptr, !llvm.ptr<3> loc(#loc1)
// CHECK-NEXT:     %32 = llvm.mlir.addressof @call_flags : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg1, %32 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc1)
// CHECK-NEXT:     %33 = llvm.mlir.addressof @extra_abi_data : !llvm.ptr<array<10 x i256>> loc(#loc1)
// CHECK-NEXT:     %c0_i256_20 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c0_i256_21 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %34 = llvm.getelementptr %33[%c0_i256_20, %c0_i256_21] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg2, %34 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_22 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i256_23 = arith.constant 1 : i256 loc(#loc1)
// CHECK-NEXT:     %35 = llvm.getelementptr %33[%c0_i256_22, %c1_i256_23] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg3, %35 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_24 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c2_i256_25 = arith.constant 2 : i256 loc(#loc1)
// CHECK-NEXT:     %36 = llvm.getelementptr %33[%c0_i256_24, %c2_i256_25] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg4, %36 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_26 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c3_i256_27 = arith.constant 3 : i256 loc(#loc1)
// CHECK-NEXT:     %37 = llvm.getelementptr %33[%c0_i256_26, %c3_i256_27] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg5, %37 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_28 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c4_i256_29 = arith.constant 4 : i256 loc(#loc1)
// CHECK-NEXT:     %38 = llvm.getelementptr %33[%c0_i256_28, %c4_i256_29] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg6, %38 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_30 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c5_i256_31 = arith.constant 5 : i256 loc(#loc1)
// CHECK-NEXT:     %39 = llvm.getelementptr %33[%c0_i256_30, %c5_i256_31] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg7, %39 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_32 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c6_i256_33 = arith.constant 6 : i256 loc(#loc1)
// CHECK-NEXT:     %40 = llvm.getelementptr %33[%c0_i256_32, %c6_i256_33] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg8, %40 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_34 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c7_i256_35 = arith.constant 7 : i256 loc(#loc1)
// CHECK-NEXT:     %41 = llvm.getelementptr %33[%c0_i256_34, %c7_i256_35] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg9, %41 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_36 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c8_i256_37 = arith.constant 8 : i256 loc(#loc1)
// CHECK-NEXT:     %42 = llvm.getelementptr %33[%c0_i256_36, %c8_i256_37] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg10, %42 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c0_i256_38 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c9_i256_39 = arith.constant 9 : i256 loc(#loc1)
// CHECK-NEXT:     %43 = llvm.getelementptr %33[%c0_i256_38, %c9_i256_39] : (!llvm.ptr<array<10 x i256>>, i256, i256) -> !llvm.ptr, !llvm.array<10 x i256> loc(#loc1)
// CHECK-NEXT:     llvm.store %arg11, %43 {alignment = 32 : i64} : i256, !llvm.ptr loc(#loc1)
// CHECK-NEXT:     %c1_i256_40 = arith.constant 1 : i256 loc(#loc1)
// CHECK-NEXT:     %44 = arith.andi %arg1, %c1_i256_40 : i256 loc(#loc1)
// CHECK-NEXT:     %c1_i256_41 = arith.constant 1 : i256 loc(#loc1)
// CHECK-NEXT:     %45 = arith.cmpi eq, %44, %c1_i256_41 : i256 loc(#loc1)
// CHECK-NEXT:     scf.if %45 {
// CHECK-NEXT:       func.call @__deploy() : () -> () loc(#loc1)
// CHECK-NEXT:     } else {
// CHECK-NEXT:       func.call @__runtime() : () -> () loc(#loc1)
// CHECK-NEXT:     } loc(#loc1)
// CHECK-NEXT:     llvm.unreachable loc(#loc1)
// CHECK-NEXT:   } loc(#loc)
// CHECK-NEXT:   func.func @unchk_51.0(%arg0: i256 loc({{.*}}:8:17), %arg1: i256 loc({{.*}}:8:25)) attributes {llvm.linkage = #llvm.linkage<private>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality, state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:     %c1_i256 = arith.constant 1 : i256 loc(#loc3)
// CHECK-NEXT:     %0 = llvm.alloca %c1_i256 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc3)
// CHECK-NEXT:     llvm.store %arg0, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc3)
// CHECK-NEXT:     %c1_i256_0 = arith.constant 1 : i256 loc(#loc4)
// CHECK-NEXT:     %1 = llvm.alloca %c1_i256_0 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc4)
// CHECK-NEXT:     llvm.store %arg1, %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc4)
// CHECK-NEXT:     %2 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc5)
// CHECK-NEXT:     %3 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc6)
// CHECK-NEXT:     %4 = arith.addi %3, %2 : i256 loc(#loc6)
// CHECK-NEXT:     llvm.store %4, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc6)
// CHECK-NEXT:     %5 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc7)
// CHECK-NEXT:     %6 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc8)
// CHECK-NEXT:     %7 = arith.subi %6, %5 : i256 loc(#loc8)
// CHECK-NEXT:     llvm.store %7, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc8)
// CHECK-NEXT:     %8 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc9)
// CHECK-NEXT:     %9 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc10)
// CHECK-NEXT:     %10 = arith.muli %9, %8 : i256 loc(#loc10)
// CHECK-NEXT:     llvm.store %10, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc10)
// CHECK-NEXT:     %11 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc11)
// CHECK-NEXT:     %12 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc12)
// CHECK-NEXT:     %13 = arith.addi %11, %12 : i256 loc(#loc11)
// CHECK-NEXT:     call @f_12.0(%13) : (i256) -> () loc(#loc13)
// CHECK-NEXT:     %14 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc14)
// CHECK-NEXT:     %15 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc15)
// CHECK-NEXT:     %16 = arith.subi %14, %15 : i256 loc(#loc14)
// CHECK-NEXT:     call @f_12.0(%16) : (i256) -> () loc(#loc16)
// CHECK-NEXT:     %17 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc17)
// CHECK-NEXT:     %18 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc18)
// CHECK-NEXT:     %19 = arith.muli %17, %18 : i256 loc(#loc17)
// CHECK-NEXT:     call @f_12.0(%19) : (i256) -> () loc(#loc19)
// CHECK-NEXT:     return loc(#loc2)
// CHECK-NEXT:   } loc(#loc2)
// CHECK-NEXT:   func.func @f_12.0(%arg0: i256 loc({{.*}}:4:13)) attributes {llvm.linkage = #llvm.linkage<private>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality, state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:     %c1_i256 = arith.constant 1 : i256 loc(#loc21)
// CHECK-NEXT:     %0 = llvm.alloca %c1_i256 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc21)
// CHECK-NEXT:     llvm.store %arg0, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc21)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc22)
// CHECK-NEXT:     %1 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc23)
// CHECK-NEXT:     %2 = llvm.inttoptr %c0_i256 : i256 to !llvm.ptr<5> loc(#loc24)
// CHECK-NEXT:     llvm.store %1, %2 {alignment = 1 : i64} : i256, !llvm.ptr<5> loc(#loc24)
// CHECK-NEXT:     return loc(#loc20)
// CHECK-NEXT:   } loc(#loc20)
// CHECK-NEXT:   func.func @f_12(%arg0: i256 loc({{.*}}:4:13)) attributes {llvm.linkage = #llvm.linkage<private>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality, runtime, state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:     %c1_i256 = arith.constant 1 : i256 loc(#loc21)
// CHECK-NEXT:     %0 = llvm.alloca %c1_i256 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc21)
// CHECK-NEXT:     llvm.store %arg0, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc21)
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc22)
// CHECK-NEXT:     %1 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc23)
// CHECK-NEXT:     %2 = llvm.inttoptr %c0_i256 : i256 to !llvm.ptr<5> loc(#loc24)
// CHECK-NEXT:     llvm.store %1, %2 {alignment = 1 : i64} : i256, !llvm.ptr<5> loc(#loc24)
// CHECK-NEXT:     return loc(#loc20)
// CHECK-NEXT:   } loc(#loc20)
// CHECK-NEXT:   func.func @unchk_51(%arg0: i256 loc({{.*}}:8:17), %arg1: i256 loc({{.*}}:8:25)) attributes {llvm.linkage = #llvm.linkage<private>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality, runtime, state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:     %c1_i256 = arith.constant 1 : i256 loc(#loc3)
// CHECK-NEXT:     %0 = llvm.alloca %c1_i256 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc3)
// CHECK-NEXT:     llvm.store %arg0, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc3)
// CHECK-NEXT:     %c1_i256_0 = arith.constant 1 : i256 loc(#loc4)
// CHECK-NEXT:     %1 = llvm.alloca %c1_i256_0 x i256 : (i256) -> !llvm.ptr<i256> loc(#loc4)
// CHECK-NEXT:     llvm.store %arg1, %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc4)
// CHECK-NEXT:     %2 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc5)
// CHECK-NEXT:     %3 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc6)
// CHECK-NEXT:     %4 = arith.addi %3, %2 : i256 loc(#loc6)
// CHECK-NEXT:     llvm.store %4, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc6)
// CHECK-NEXT:     %5 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc7)
// CHECK-NEXT:     %6 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc8)
// CHECK-NEXT:     %7 = arith.subi %6, %5 : i256 loc(#loc8)
// CHECK-NEXT:     llvm.store %7, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc8)
// CHECK-NEXT:     %8 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc9)
// CHECK-NEXT:     %9 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc10)
// CHECK-NEXT:     %10 = arith.muli %9, %8 : i256 loc(#loc10)
// CHECK-NEXT:     llvm.store %10, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc10)
// CHECK-NEXT:     %11 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc11)
// CHECK-NEXT:     %12 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc12)
// CHECK-NEXT:     %13 = arith.addi %11, %12 : i256 loc(#loc11)
// CHECK-NEXT:     call @f_12(%13) : (i256) -> () loc(#loc13)
// CHECK-NEXT:     %14 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc14)
// CHECK-NEXT:     %15 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc15)
// CHECK-NEXT:     %16 = arith.subi %14, %15 : i256 loc(#loc14)
// CHECK-NEXT:     call @f_12(%16) : (i256) -> () loc(#loc16)
// CHECK-NEXT:     %17 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc17)
// CHECK-NEXT:     %18 = llvm.load %1 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc18)
// CHECK-NEXT:     %19 = arith.muli %17, %18 : i256 loc(#loc17)
// CHECK-NEXT:     call @f_12(%19) : (i256) -> () loc(#loc19)
// CHECK-NEXT:     return loc(#loc2)
// CHECK-NEXT:   } loc(#loc2)
// CHECK-NEXT:   func.func private @__personality() -> i32 attributes {llvm.linkage = #llvm.linkage<external>, passthrough = ["nofree", "null_pointer_is_valid"], personality = @__personality} loc(#loc)
// CHECK-NEXT: } loc(#loc)
// CHECK-NEXT: #loc = loc(unknown)
// CHECK-NEXT: #loc2 = loc({{.*}}:8:2)
// CHECK-NEXT: #loc5 = loc({{.*}}:10:11)
// CHECK-NEXT: #loc6 = loc({{.*}}:10:6)
// CHECK-NEXT: #loc7 = loc({{.*}}:11:11)
// CHECK-NEXT: #loc8 = loc({{.*}}:11:6)
// CHECK-NEXT: #loc9 = loc({{.*}}:12:11)
// CHECK-NEXT: #loc10 = loc({{.*}}:12:6)
// CHECK-NEXT: #loc11 = loc({{.*}}:14:8)
// CHECK-NEXT: #loc12 = loc({{.*}}:14:12)
// CHECK-NEXT: #loc13 = loc({{.*}}:14:6)
// CHECK-NEXT: #loc14 = loc({{.*}}:15:8)
// CHECK-NEXT: #loc15 = loc({{.*}}:15:12)
// CHECK-NEXT: #loc16 = loc({{.*}}:15:6)
// CHECK-NEXT: #loc17 = loc({{.*}}:16:8)
// CHECK-NEXT: #loc18 = loc({{.*}}:16:12)
// CHECK-NEXT: #loc19 = loc({{.*}}:16:6)
// CHECK-NEXT: #loc20 = loc({{.*}}:4:2)
// CHECK-NEXT: #loc22 = loc({{.*}}:3:2)
// CHECK-NEXT: #loc23 = loc({{.*}}:5:8)
// CHECK-NEXT: #loc24 = loc({{.*}}:5:4)
// CHECK-EMPTY:
