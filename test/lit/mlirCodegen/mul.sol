// RUN: solc --mlir-action=print-init %s | FileCheck %s
// RUN: solc --mlir-action=print-init --mmlir --mlir-print-debuginfo %s | FileCheck --check-prefix=DBG %s

contract C {
	function f(uint a) public returns (uint d) { return a * 7; }
}

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: module {
// CHECK-NEXT:   sol.contract @C_13 {
// CHECK-NEXT:     func.func @f_12(%arg0: i256) -> i256 attributes {llvm.linkage = #llvm.linkage<private>} {
// CHECK-NEXT:       %c1_i256 = arith.constant 1 : i256
// CHECK-NEXT:       %0 = llvm.alloca %c1_i256 x i256 {alignment = 32 : i64} : (i256) -> !llvm.ptr<i256>
// CHECK-NEXT:       llvm.store %arg0, %0 {alignment = 32 : i64} : !llvm.ptr<i256>
// CHECK-NEXT:       %1 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256>
// CHECK-NEXT:       %c7_i8 = arith.constant 7 : i8
// CHECK-NEXT:       %2 = arith.extui %c7_i8 : i8 to i256
// CHECK-NEXT:       %3 = arith.muli %1, %2 : i256
// CHECK-NEXT:       return %3 : i256
// CHECK-NEXT:     }
// CHECK-NEXT:   } {interface_fns = [{selector = "b3de648b", sym = @f_12, type = (i256) -> i256}], kind = #sol<ContractKind Contract>}
// CHECK-NEXT: }
// CHECK-EMPTY:
// DBG: #loc3 = loc({{.*}}:4:12)
// DBG-NEXT: module {
// DBG-NEXT:   sol.contract @C_13 {
// DBG-NEXT:     func.func @f_12(%arg0: i256 loc({{.*}}:4:12)) -> i256 attributes {llvm.linkage = #llvm.linkage<private>} {
// DBG-NEXT:       %c1_i256 = arith.constant 1 : i256 loc(#loc3)
// DBG-NEXT:       %0 = llvm.alloca %c1_i256 x i256 {alignment = 32 : i64} : (i256) -> !llvm.ptr<i256> loc(#loc3)
// DBG-NEXT:       llvm.store %arg0, %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc3)
// DBG-NEXT:       %1 = llvm.load %0 {alignment = 32 : i64} : !llvm.ptr<i256> loc(#loc4)
// DBG-NEXT:       %c7_i8 = arith.constant 7 : i8 loc(#loc5)
// DBG-NEXT:       %2 = arith.extui %c7_i8 : i8 to i256 loc(#loc5)
// DBG-NEXT:       %3 = arith.muli %1, %2 : i256 loc(#loc4)
// DBG-NEXT:       return %3 : i256 loc(#loc6)
// DBG-NEXT:     } loc(#loc2)
// DBG-NEXT:   } {interface_fns = [{selector = "b3de648b", sym = @f_12, type = (i256) -> i256}], kind = #sol<ContractKind Contract>} loc(#loc1)
// DBG-NEXT: } loc(#loc0)
// DBG-NEXT: #loc0 = loc(unknown)
// DBG-NEXT: #loc1 = loc({{.*}}:3:0)
// DBG-NEXT: #loc2 = loc({{.*}}:4:1)
// DBG-NEXT: #loc4 = loc({{.*}}:4:53)
// DBG-NEXT: #loc5 = loc({{.*}}:4:57)
// DBG-NEXT: #loc6 = loc({{.*}}:4:46)
// DBG-EMPTY:
