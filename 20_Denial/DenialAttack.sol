    DenialAttack.sol 

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.6.0;

    contract DenialAttack {
    	receive() external payable {
    		assert(false);//error condition //assert does not refund ^0.6.0! when it create this error assert false.
    		}//any of gas it sucks it up //45:01
    		//consume all of the gas that been forwarded to it and also throw an error
    		//require(condition, "an error") //require throw an error.using function input vlidation right you have a condition and your statement 
    		//revert("an error")//revert throw an error. usually used with nested if logic 
    		//require and revert would obviously undo state changes and return an error just like assert, also refund the remaining gas not the case with assert false 
    }//these error conditions returns gas that was forwarded to a calling to a contract that was being called they returned it. 