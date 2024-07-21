// RUN: solc --mlir-action=print-init --mmlir --mlir-print-debuginfo %s | FileCheck %s

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

// TODO: Test comparison operators.

// NOTE: Assertions have been autogenerated by test/updFileCheckTest.py
// CHECK: #loc4 = loc({{.*}}:4:13)
// CHECK-NEXT: #loc8 = loc({{.*}}:8:17)
// CHECK-NEXT: #loc9 = loc({{.*}}:8:25)
// CHECK-NEXT: module {
// CHECK-NEXT:   sol.contract @C_52 {
// CHECK-NEXT:     sol.state_var @m : i256 loc(#loc2)
// CHECK-NEXT:     sol.func @f_12(%arg0: i256 loc({{.*}}:4:13)) attributes {state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:       %0 = sol.alloca : !sol.ptr<i256, Stack> loc(#loc4)
// CHECK-NEXT:       sol.store %arg0, %0 : i256, !sol.ptr<i256, Stack> loc(#loc4)
// CHECK-NEXT:       %1 = sol.addr_of @m : !sol.ptr<i256, Storage> loc(#loc2)
// CHECK-NEXT:       %2 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc5)
// CHECK-NEXT:       sol.store %2, %1 : i256, !sol.ptr<i256, Storage> loc(#loc6)
// CHECK-NEXT:       sol.return loc(#loc3)
// CHECK-NEXT:     } loc(#loc3)
// CHECK-NEXT:     sol.func @unchk_51(%arg0: i256 loc({{.*}}:8:17), %arg1: i256 loc({{.*}}:8:25)) attributes {state_mutability = #sol<StateMutability NonPayable>} {
// CHECK-NEXT:       %0 = sol.alloca : !sol.ptr<i256, Stack> loc(#loc8)
// CHECK-NEXT:       sol.store %arg0, %0 : i256, !sol.ptr<i256, Stack> loc(#loc8)
// CHECK-NEXT:       %1 = sol.alloca : !sol.ptr<i256, Stack> loc(#loc9)
// CHECK-NEXT:       sol.store %arg1, %1 : i256, !sol.ptr<i256, Stack> loc(#loc9)
// CHECK-NEXT:       %2 = sol.load %1 : !sol.ptr<i256, Stack>, i256 loc(#loc10)
// CHECK-NEXT:       %3 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc11)
// CHECK-NEXT:       %4 = arith.addi %3, %2 : i256 loc(#loc11)
// CHECK-NEXT:       sol.store %4, %0 : i256, !sol.ptr<i256, Stack> loc(#loc11)
// CHECK-NEXT:       %5 = sol.load %1 : !sol.ptr<i256, Stack>, i256 loc(#loc12)
// CHECK-NEXT:       %6 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc13)
// CHECK-NEXT:       %7 = arith.subi %6, %5 : i256 loc(#loc13)
// CHECK-NEXT:       sol.store %7, %0 : i256, !sol.ptr<i256, Stack> loc(#loc13)
// CHECK-NEXT:       %8 = sol.load %1 : !sol.ptr<i256, Stack>, i256 loc(#loc14)
// CHECK-NEXT:       %9 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc15)
// CHECK-NEXT:       %10 = arith.muli %9, %8 : i256 loc(#loc15)
// CHECK-NEXT:       sol.store %10, %0 : i256, !sol.ptr<i256, Stack> loc(#loc15)
// CHECK-NEXT:       %11 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc16)
// CHECK-NEXT:       %12 = sol.load %1 : !sol.ptr<i256, Stack>, i256 loc(#loc17)
// CHECK-NEXT:       %13 = arith.addi %11, %12 : i256 loc(#loc16)
// CHECK-NEXT:       sol.call @f_12(%13) : (i256) -> () loc(#loc18)
// CHECK-NEXT:       %14 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc19)
// CHECK-NEXT:       %15 = sol.load %1 : !sol.ptr<i256, Stack>, i256 loc(#loc20)
// CHECK-NEXT:       %16 = arith.subi %14, %15 : i256 loc(#loc19)
// CHECK-NEXT:       sol.call @f_12(%16) : (i256) -> () loc(#loc21)
// CHECK-NEXT:       %17 = sol.load %0 : !sol.ptr<i256, Stack>, i256 loc(#loc22)
// CHECK-NEXT:       %18 = sol.load %1 : !sol.ptr<i256, Stack>, i256 loc(#loc23)
// CHECK-NEXT:       %19 = arith.muli %17, %18 : i256 loc(#loc22)
// CHECK-NEXT:       sol.call @f_12(%19) : (i256) -> () loc(#loc24)
// CHECK-NEXT:       sol.return loc(#loc7)
// CHECK-NEXT:     } loc(#loc7)
// CHECK-NEXT:   } {interface_fns = [{selector = -1231012231 : i32, sym = @unchk_51, type = (i256, i256) -> ()}], kind = #sol<ContractKind Contract>} loc(#loc1)
// CHECK-NEXT: } loc(#loc)
// CHECK-NEXT: #loc = loc(unknown)
// CHECK-NEXT: #loc1 = loc({{.*}}:2:0)
// CHECK-NEXT: #loc2 = loc({{.*}}:3:2)
// CHECK-NEXT: #loc3 = loc({{.*}}:4:2)
// CHECK-NEXT: #loc5 = loc({{.*}}:5:8)
// CHECK-NEXT: #loc6 = loc({{.*}}:5:4)
// CHECK-NEXT: #loc7 = loc({{.*}}:8:2)
// CHECK-NEXT: #loc10 = loc({{.*}}:10:11)
// CHECK-NEXT: #loc11 = loc({{.*}}:10:6)
// CHECK-NEXT: #loc12 = loc({{.*}}:11:11)
// CHECK-NEXT: #loc13 = loc({{.*}}:11:6)
// CHECK-NEXT: #loc14 = loc({{.*}}:12:11)
// CHECK-NEXT: #loc15 = loc({{.*}}:12:6)
// CHECK-NEXT: #loc16 = loc({{.*}}:14:8)
// CHECK-NEXT: #loc17 = loc({{.*}}:14:12)
// CHECK-NEXT: #loc18 = loc({{.*}}:14:6)
// CHECK-NEXT: #loc19 = loc({{.*}}:15:8)
// CHECK-NEXT: #loc20 = loc({{.*}}:15:12)
// CHECK-NEXT: #loc21 = loc({{.*}}:15:6)
// CHECK-NEXT: #loc22 = loc({{.*}}:16:8)
// CHECK-NEXT: #loc23 = loc({{.*}}:16:12)
// CHECK-NEXT: #loc24 = loc({{.*}}:16:6)
// CHECK-EMPTY:
