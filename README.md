# Investa-X Coding Challenge

This is my personal solution project that solves the coding challenge set by InvestaX

Challenge requirements:

```shell
● Upgradable using UUPS proxy pattern

● Have 3 main functions: deposit, withdrawal request and claim

● Deposit accepts a standard erc-20 token (Create any standard erc-20 token with max
supply of 1,000,000 with ticker TKN1)

● Deposit should transfer the user's TKN1 to the contract xyz and track sender's deposit
balance

● Withdrawal Request accepts an input amount, which cannot exceed their deposit
balance.

● Withdrawal Request should decrease the sender's deposit balance and create a
mapping of sender's total withdrawal requests.

● Claim should allow to user to withdraw all of their withdrawal requests in a form of TKN2

● For simplicity, TKN1 and TKN2 will be of the same exchange rate.

● TKN2 is a standard erc-20 token, with unlimited supply.

● Owners should be able to 'fund' ContractXyz with TKN2 to fulfill any Claims.

● Write contract in 0.8+ version of solidity, using Hardhat

● Deploy and verify contracts in ETH Sepolia network

● Bonus points if can write hardhat tests

● Once done, submit the contract address of ContractXyz, TKN and TKN2.
```

Try running some of the following tasks:

```shell
git clone

npm install

npx hardhat compile

npx hardhat run scripts/deploy.js --network sepolia
```
