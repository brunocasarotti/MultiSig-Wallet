// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./Allowance.sol";

contract MultiSigWallet is Allowance {
    event MoneySent(address indexed to, address indexed from, uint256 amount);
    event MoneyReceived(address indexed from, uint256 amount);

    function transfer(address payable to, uint256 amount)
        public
        payable
        isOwnerOrAllowed(amount)
    {
        require(amount <= address(this).balance, "Not enough funds");
        if (!isOwner()) {
            reduceAllowance(msg.sender, amount);
        }
        to.transfer(amount);
        emit MoneySent(to, msg.sender, amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function renounceOwnership() public override pure {
        revert("Can't renounce ownership!");
    }

    receive() external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}
