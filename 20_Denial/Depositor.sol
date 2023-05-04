//Depositor.sol 

pragma solidity ^0.8.0;

contract Depositor {
	//transfer
	function depositUsingTransfer(address payable _to) public payable {
		_to.transfer(msg.value); //2300Gas. if "function() external function {}", throw error //you can call other contract and you can send money to other 
	}//this design goal here of limiting the amount of gas that's forwarded to the receiving contract to just 2300 of gas is designed mitigate against re-entrancy attack 

    
    //send 
	function depositusingSend(address payable _to) public payable {
		bool sent = _to.send(msg.value); //return true/false boolean //send is minimum amount of gas nesssary to allow the receiving function
		require(sent, "Failure! Ether not sent");
	}
    
    //*call -> best way one address to another 
	function depositUsingCall(address payable _to) public payable {
		(bool sent, bytes memory data) = _to.call{gas:1000,value: msg.value}(""); //call is sending money or transferring decentralized money from one contract to another contract 
		//.call allows you to call any other function on ethereum (external or public) 
		// ex("make contract(uint256 arg1)");<= you can pass a method signature in here to call any other function on any other contract
		//("")-> specifying a function signature as the parameter. we're call receive function because we have not provided a function signature 
		//you can specifically the amount of gas that you want to use you can put as much gas that passed called contract 
		//if you don't specify this gas, all of the gas that you have remaining to complete this transaction automatically gets forwarded to the contract you're trying to call ex _to.call.gas(10000){value: msg.value}("");
        //you do have the "fine grained access control" of specifically specifying how much gas you want to pass to the contract that you're trying to send money to you have the ability when you use .call again  ex _to.call{gas:1000,value: msg.value}("");
		require(sent, "Failure! Ether not sent"); 
	}
}