// RUN: solc --mlir-action=print-init %s | FileCheck %s
// RUN: solc --mlir-action=print-init --mmlir --mlir-print-debuginfo %s | FileCheck --check-prefix=DBG %s

contract C {
  function f() public pure {}
}

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: module {
// CHECK-NEXT:   sol.contract @C_5 {
// CHECK-NEXT:     func.func @f_4() {
// CHECK-NEXT:       return
// CHECK-NEXT:     }
// CHECK-NEXT:   } {interface_fns = [{selector = "26121ff0", sym = @f_4, type = () -> ()}], kind = #sol<ContractKind Contract>}
// CHECK-NEXT: }
// CHECK-EMPTY:
// DBG: module {
// DBG-NEXT:   sol.contract @C_5 {
// DBG-NEXT:     func.func @f_4() {
// DBG-NEXT:       return loc(#loc2)
// DBG-NEXT:     } loc(#loc2)
// DBG-NEXT:   } {interface_fns = [{selector = "26121ff0", sym = @f_4, type = () -> ()}], kind = #sol<ContractKind Contract>} loc(#loc1)
// DBG-NEXT: } loc(#loc0)
// DBG-NEXT: #loc0 = loc(unknown)
// DBG-NEXT: #loc1 = loc({{.*}}:3:0)
// DBG-NEXT: #loc2 = loc({{.*}}:4:2)
// DBG-EMPTY:
