// RUN: solc --mlir-action=print-init --mmlir --mlir-print-debuginfo %s | FileCheck %s

contract C {
  uint m;
  constructor(uint a) {
    m = a;
  }
}

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: #loc4 = loc({{.*}}:4:14)
// CHECK-NEXT: module {
// CHECK-NEXT:   sol.contract @C_13 {
// CHECK-NEXT:     sol.state_var @m : i256 loc(#loc2)
// CHECK-NEXT:     sol.func @_12(%arg0: i256 loc({{.*}}:4:14)) attributes {ctor, state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:       %0 = sol.alloca : !sol.ptr<i256, Stack> loc(#loc4)
// CHECK-NEXT:       sol.store %arg0, %0 : i256, !sol.ptr<i256, Stack> loc(#loc4)
// CHECK-NEXT:       %1 = sol.addr_of @m : !sol.ptr<i256, Storage> loc(#loc2)
// CHECK-NEXT:       %2 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc5)
// CHECK-NEXT:       sol.store %2, %1 : i256, !sol.ptr<i256, Storage> loc(#loc6)
// CHECK-NEXT:       sol.return loc(#loc3)
// CHECK-NEXT:     } loc(#loc3)
// CHECK-NEXT:   } {interface_fns = [], kind = #sol<ContractKind Contract>} loc(#loc1)
// CHECK-NEXT: } loc(#loc)
// CHECK-NEXT: #loc = loc(unknown)
// CHECK-NEXT: #loc1 = loc({{.*}}:2:0)
// CHECK-NEXT: #loc2 = loc({{.*}}:3:2)
// CHECK-NEXT: #loc3 = loc({{.*}}:4:2)
// CHECK-NEXT: #loc5 = loc({{.*}}:5:8)
// CHECK-NEXT: #loc6 = loc({{.*}}:5:4)
// CHECK-EMPTY:
