// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        // Constructor function to set defaults
        owner = msg.sender;
    }

    function _receive() public payable {
        // This function will receive money
        balance += msg.value;
    }

    function withdraw(address payable _to, uint256 amount) public {
        /* Function to withdraw money to any valid account
           Some checks must be done before withdrawing:
            1) check if the request is from the owner of the account
            2) check if the balance is enough to withdraw   
        */
        require(msg.sender == owner, "Permission denied");
        require(amount <= balance, "Insufficient funds");

        // after transfering the money, balance should be reduced
        _to.transfer(amount);
        balance -= amount;
    }
}
