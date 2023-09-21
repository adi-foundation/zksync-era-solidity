contract helper {
    function getBalance() public payable returns (uint256 myBalance) {
        return address(this).balance;
    }
}


contract test {
    helper h;

    constructor() payable {
        h = new helper();
    }

    function sendAmount(uint256 amount) public payable returns (uint256 bal) {
        uint256 someStackElement = 20;
        return h.getBalance{value: amount + 3, gas: 1000}();
    }
}

// ----
// constructor(), 20 wei ->
// gas irOptimized: 177413
// gas legacy: 273023
// gas legacyOptimized: 217712
// sendAmount(uint256): 5 -> 8
