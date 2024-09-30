// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ContractXYZ {
    IERC20 public tkn1;
    IERC20 public tkn2;

    mapping(address => uint256) public depositBalance;
    mapping(address => uint256) public withdrawalRequests;

    address public owner;

    constructor(address _tkn1, address _tkn2) {
        tkn1 = IERC20(_tkn1);
        tkn2 = IERC20(_tkn2);
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Deposit function to accept TKN1
    function deposit(uint256 amount) external {
        require(amount > 0, "Amount should be greater than 0");
        tkn1.transferFrom(msg.sender, address(this), amount);
        depositBalance[msg.sender] += amount;
    }

    // Withdrawal request
    function requestWithdrawal(uint256 amount) external {
        require(amount <= depositBalance[msg.sender], "Amount exceeds deposit balance");
        depositBalance[msg.sender] -= amount;
        withdrawalRequests[msg.sender] += amount;
    }

    // Claim function to withdraw TKN2
    function claim() external {
        uint256 amount = withdrawalRequests[msg.sender];
        require(amount > 0, "No withdrawal requests");

        withdrawalRequests[msg.sender] = 0;
        tkn2.transfer(msg.sender, amount);
    }

    // Owner can fund the contract with TKN2
    function fundTKN2(uint256 amount) external onlyOwner {
        tkn2.transferFrom(msg.sender, address(this), amount);
    }
}
