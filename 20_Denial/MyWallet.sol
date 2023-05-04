//MyWallet.sol

pragma solidity ^0.8.0;

contract MyWallet {
	receive() external payable{//receive has up-to-date way of allowing a contract to receive money 
		 //you have to careful as always about re-entrancy vlunabilities 
		//prevent anybody writing significant amount of code in the receive function of a contract that's having money deposited into it th
	} //you need to write a receive or fallback function at could result re-entrancy vlunerability and could ultimately siphon off funds from a contract 
	


	function getContractBalance() public view returns (uint) {
		return address(this).balance;
	}
}
