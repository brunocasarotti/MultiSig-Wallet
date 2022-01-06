# MultiSig Wallet
## Building
### Requirements
1. Node
2. Truffle

To build the project:
```
truffle compile
```
### Deploying to Rinkeby
Configure an Infura account and project and create a ```.env``` file as below:
```
SECRET=INSERT HERE YOU WALLET RECOVERY 21 WORDS - KEEP IT SAFE!
INFURA_PROJECT_ID=INSERT HERE YOUR INFURA PROJECT ID
```

Make sure your wallet has enough faucets to deploy the contract and run
```
truffle migrate --network rinkeby
```
If it works you should see something like this:
````
   Replacing 'MultiSigWallet'
   --------------------------
   > transaction hash:    0x4a40ac0574e305de28c658cc9c95da9ce1fe78c4de82596d56c61cb4d3828426
   > Blocks: 1            Seconds: 12
   > contract address:    0x5032C29FeA1F1e62D537Ca3866850E2Ff3f6ffd4
   > block number:        9944932
   > block timestamp:     1641486599
   > account:             0x4982CA636ff377a7218B2025A90C3DD762ed7c79
   > balance:             8.587429113930209871
   > gas used:            907885 (0xdda6d)
   > gas price:           2.545345366 gwei
   > value sent:          0 ETH
   > total cost:          0.00231088087761091 ETH
```