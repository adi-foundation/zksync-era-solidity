// RUN: solc --mlir-action=print-init --mmlir --mlir-print-debuginfo %s | FileCheck %s

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
  uint ui;
  mapping(address => uint) m0;

  function f_ui() public view returns (uint) { return ui; }
  function f_m0(address k) public view returns (uint) { return m0[k]; }
}

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: #loc8 = loc({{.*}}:10:16)
// CHECK-NEXT: module {
// CHECK-NEXT:   sol.contract @C_28 {
// CHECK-NEXT:     sol.state_var @ui : i256 loc(#loc2)
// CHECK-NEXT:     sol.state_var @m0 : !sol.mapping<i256, i256> loc(#loc3)
// CHECK-NEXT:     sol.func @f_ui_15() -> i256 attributes {state_mutability = #sol<StateMutability View>} {
// CHECK-NEXT:       %0 = sol.addr_of @ui : !sol.ptr<i256, Storage> loc(#loc2)
// CHECK-NEXT:       %1 = sol.load %0 : !sol.ptr<i256, Storage>, i256 loc(#loc5)
// CHECK-NEXT:       sol.return %1 : i256 loc(#loc6)
// CHECK-NEXT:     } loc(#loc4)
// CHECK-NEXT:     sol.func @f_m0_27(%arg0: i256 loc({{.*}}:10:16)) -> i256 attributes {state_mutability = #sol<StateMutability View>} {
// CHECK-NEXT:       %0 = sol.alloca : !sol.ptr<i256, Stack> loc(#loc8)
// CHECK-NEXT:       sol.store %arg0, %0 : i256, !sol.ptr<i256, Stack> loc(#loc8)
// CHECK-NEXT:       %1 = sol.addr_of @m0 : !sol.mapping<i256, i256> loc(#loc3)
// CHECK-NEXT:       %2 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc9)
// CHECK-NEXT:       %3 = sol.map %1, %2 : !sol.mapping<i256, i256>, !sol.ptr<i256, Storage> loc(#loc10)
// CHECK-NEXT:       %4 = sol.load %3 : !sol.ptr<i256, Storage>, i256 loc(#loc10)
// CHECK-NEXT:       sol.return %4 : i256 loc(#loc11)
// CHECK-NEXT:     } loc(#loc7)
// CHECK-NEXT:   } {interface_fns = [{selector = "c2bf6003", sym = @f_m0_27, type = (i256) -> i256}, {selector = "eb80bd39", sym = @f_ui_15, type = () -> i256}], kind = #sol<ContractKind Contract>} loc(#loc1)
// CHECK-NEXT: } loc(#loc)
// CHECK-NEXT: #loc = loc(unknown)
// CHECK-NEXT: #loc1 = loc({{.*}}:5:0)
// CHECK-NEXT: #loc2 = loc({{.*}}:6:2)
// CHECK-NEXT: #loc3 = loc({{.*}}:7:2)
// CHECK-NEXT: #loc4 = loc({{.*}}:9:2)
// CHECK-NEXT: #loc5 = loc({{.*}}:9:54)
// CHECK-NEXT: #loc6 = loc({{.*}}:9:47)
// CHECK-NEXT: #loc7 = loc({{.*}}:10:2)
// CHECK-NEXT: #loc9 = loc({{.*}}:10:66)
// CHECK-NEXT: #loc10 = loc({{.*}}:10:63)
// CHECK-NEXT: #loc11 = loc({{.*}}:10:56)
// CHECK-EMPTY:
