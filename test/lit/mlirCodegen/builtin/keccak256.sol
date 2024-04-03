// RUN: solc --yul --mlir-action=print-init --mmlir --mlir-print-debuginfo --mlir-target=eravm %s | FileCheck %s

object "Test" {
  code {
    return(keccak256(0, 0x40), 0)
  }
  object "Test_deployed" {
    code {
      return(keccak256(0, 0x40), 0)
    }
  }
}

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: module {
// CHECK-NEXT:   sol.object @Test {
// CHECK-NEXT:     %c0_i256 = arith.constant 0 : i256 loc(#loc1)
// CHECK-NEXT:     %c64_i256 = arith.constant 64 : i256 loc(#loc2)
// CHECK-NEXT:     %0 = sol.keccak256 %c0_i256, %c64_i256 loc(#loc3)
// CHECK-NEXT:     %c0_i256_0 = arith.constant 0 : i256 loc(#loc4)
// CHECK-NEXT:     sol.builtin_ret %0, %c0_i256_0 loc(#loc5)
// CHECK-NEXT:     sol.object @Test_deployed {
// CHECK-NEXT:       %c0_i256_1 = arith.constant 0 : i256 loc(#loc6)
// CHECK-NEXT:       %c64_i256_2 = arith.constant 64 : i256 loc(#loc7)
// CHECK-NEXT:       %1 = sol.keccak256 %c0_i256_1, %c64_i256_2 loc(#loc8)
// CHECK-NEXT:       %c0_i256_3 = arith.constant 0 : i256 loc(#loc9)
// CHECK-NEXT:       sol.builtin_ret %1, %c0_i256_3 loc(#loc10)
// CHECK-NEXT:     } loc(#loc0)
// CHECK-NEXT:   } loc(#loc0)
// CHECK-NEXT: } loc(#loc0)
// CHECK-NEXT: #loc0 = loc(unknown)
// CHECK-NEXT: #loc1 = loc({{.*}}:4:21)
// CHECK-NEXT: #loc2 = loc({{.*}}:4:24)
// CHECK-NEXT: #loc3 = loc({{.*}}:4:11)
// CHECK-NEXT: #loc4 = loc({{.*}}:4:31)
// CHECK-NEXT: #loc5 = loc({{.*}}:4:4)
// CHECK-NEXT: #loc6 = loc({{.*}}:8:23)
// CHECK-NEXT: #loc7 = loc({{.*}}:8:26)
// CHECK-NEXT: #loc8 = loc({{.*}}:8:13)
// CHECK-NEXT: #loc9 = loc({{.*}}:8:33)
// CHECK-NEXT: #loc10 = loc({{.*}}:8:6)
// CHECK-EMPTY:
