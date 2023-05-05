In the EVM, there are 3 places to store data.

 Firstly, in the stack. We’ve just used the “PUSH” opcode to store data there as per the example above.

 Secondly in the memory (RAM) where we use the “MSTORE” opcode and 

 lastly, in the disk storage where we use “SSTORE” to store the data. 

 The gas required to store data to storage is the most expensive and storing data to stack is the cheapest.

 //Runtime OPCODE

 The code needs to return the 32 byte magic number - 42 or 0x2a (in hex).

 The corresponding opcode is RETURN. But, RETURN takes two arguments - the location of value in memory and the size of this value to be returned.

 That means the 0x2a needs to be stored in memory first - which MSTORE facilitates.

 But MSTORE itself takes two arguments - the location of value in stack and its size.

 So, we need push the value and size params into stack first using PUSH1 opcode.

```
 OPCODE       NAME
------------------
 0x60        PUSH1
 0x52        MSTORE
 0xf3        RETURN
 ```
```
 OPCODE   DETAIL
------------------------------------------------
602a     Push 0x2a in stack. 
         Value (v) param to MSTORE(0x60)

6050     Push 0x50 in stack. 
         Position (p) param to MSTORE

52       Store value,v=0x2a at position, p=0x50 in memory

6020     Push 0x20 (32 bytes, size of v) in stack. 
         Size (s) param to RETURN(0xf3)

6050     Push 0x50 (slot at which v=0x42 was stored). 
         Position (p) param to RETURN

f3      RETURN value, v=0x42 of size, s=0x20 (32 bytes)
```

Concatenate the opcodes and we get the bytecode:

602a60505260206050f3

which is exactly 10 bytes, the max limit allowed by the level!

//Initialization opcode

The initialization opcodes need to come before the runtime opcode.

These opcodes need to load runtime opcodes into memory and return the same to EVM.
```
OPCODE       NAME
------------------
 0x60        PUSH1
 0x52        MSTORE
 0xf3        RETURN
 0x39        CODECOPY
 ```

 To CODECOPY opcode can be used to copy the runtime opcodes. 

 It takes three arguments - the destination position of copied code in memory, 

 current position of runtime opcode in the bytecode and size of the code in bytes.

```
OPCODE   DETAIL
-----------------------------------------
600a     Push 0x0a (size of runtime opcode i.e. 10 bytes)
         in stack.
         Size (s) param to COPYCODE (0x39)

60--     Push -- (unknown) in stack 
         Position (p) param to COPYCODE

6000     Push 0x00 (chosen destination in memory) in stack
         Destination (d) param to COPYCODE

39       Copy code of size, s at position, p
         to destination, d in memory

600a     Push 0x0a (size of runtime opcode i.e. 10 bytes)
         in stack.
         Size (s) param to RETURN (0xf3)

6000     Push 0x00 (location of value in memory) in stack.
         Position (p) param to RETURN

f3      Return value of size, s at position, p
```

So the initialization opcode is:

600a60--600039600a6000f3



     initialization opcode + runtime opcode

=   600a600c600039600a6000f3 + 602a60505260206050f3

```
>bytecode = '600a600c600039600a6000f3602a60505260206050f3'
'600a600c600039600a6000f3602a60505260206050f3'
```
```
>txn = await web3.eth.sendTransaction({from: player, data: bytecode})
{blockHash: '0x93fe02cb4347ad1dbf2e5a897bcdd6698de517475005fa896361c04ddb39d5ab', 
blockNumber: 10936005, contractAddress: '0xD1ef6F3320C17750b6e813C08CB59c5Aa414B5F8', 
cumulativeGasUsed: 7575521, effectiveGasPrice: '0x3b9aca0f', …}
```
```
>solverAddr = txn.contractAddress 
'0xD1ef6F3320C17750b6e813C08CB59c5Aa414B5F8'
```
```
>await contract.setSolver(solverAddr)
{tx: '0x4992dac28860373224416d9575f9830818b4570c30858d335b9dc61caa75bcda', receipt: {…}, logs: Array(0)}

{tx: '0x4992dac28860373224416d9575f9830818b4570c30858d335b9dc61caa75bcda', receipt: {…}, logs: Array(0)}
logs: []
receipt:
blockHash: "0x377df0824a101d6e2a6a1128ba37d3b55ea9974558786cfc5eec71212aed6aa1"
blockNumber: 10936035
contractAddress: null
cumulativeGasUsed: 676185
effectiveGasPrice: "0x8321af66"
from: "0xf6ea8e869c68362ec2fa1b2159fe459d6d8f30f5"
gasUsed: 43811
logs: []
logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
rawLogs: []
status: true
to: "0x4b3176e3662cd8899a0b04751eb6adecf88b1a97"
transactionHash: "0x4992dac28860373224416d9575f9830818b4570c30858d335b9dc61caa75bcda"
transactionIndex: 9
type: "0x2"
[[Prototype]]: Object
tx: "0x4992dac28860373224416d9575f9830818b4570c30858d335b9dc61caa75bcda"
[[Prototype]]: Object
```
