// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    function _receive() public payable {
        balance += msg.value;
    }

    function withdraw(address payable _to, uint256 amount) public {
        require(msg.sender == owner, "Permission denied");
        require(amount <= balance, "Insufficient funds");

        _to.transfer(amount);
        balance -= amount;
    }
}