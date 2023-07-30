// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SmartContract {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint256 amount) public {
        
        require(msg.sender == owner, "Only the contract owner can deposit");

        
        assert(balance + amount >= balance);

        balance += amount;
    }

    function withdraw(uint256 amount) public {
        if(balance == 0){
            revert("There is nothing to withdraw");
        }

        require(msg.sender == owner, "Only the contract owner can withdraw");
        require(amount <= balance, "Insufficient balance");

        assert(balance - amount >= 0);

        balance -= amount;
    }

    function clearBalance() public {
        require(msg.sender == owner, "Only the contract's owner can clear the balance");
        balance=0;
    }
}
