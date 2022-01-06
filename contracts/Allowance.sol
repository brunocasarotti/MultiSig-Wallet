pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Allowance is Ownable {
    mapping(address => uint256) allowance;
    event AllowanceChaged(
        address indexed to,
        uint256 oldAmount,
        uint256 newAmount
    );
    event AllowanceRemoved(address indexed user);

    modifier isOwnerOrAllowed(uint256 amount) {
        require(
            isOwner() || allowance[msg.sender] >= amount,
            "You are not allowed"
        );
        _;
    }

    function isOwner() internal view returns (bool) {
        return msg.sender == owner();
    }

    function addAllowance(address newUser, uint256 amount) public onlyOwner {
        allowance[newUser] += amount;
        emit AllowanceChaged(
            newUser,
            allowance[newUser] - amount,
            allowance[newUser]
        );
    }

    function reduceAllowance(address user, uint256 amount) internal {
        allowance[user] -= amount;
        emit AllowanceChaged(user, allowance[user] + amount, allowance[user]);
    }

    function removeAllowance(address user) public onlyOwner {
        delete allowance[user];
        emit AllowanceRemoved(user);
    }
}
