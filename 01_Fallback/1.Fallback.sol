// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';

contract Fallback {

  using SafeMath for uint256;
  mapping(address => uint) public contributions;//internal database how much Ether each address has and how many token each address has, how much money each address has 
  address payable public owner;

//constructor deployed it set as owner 
  constructor() public {//executed lifecycle of smartcontract first get deploy
    owner = msg.sender; //send as owner 
    contributions[msg.sender] = 1000 * (1 ether); //mapping contribution set amount of Ether
  }

//modifier can applied any function in a smart contract 
  modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }

//contributionsの構成にsecurityhallがある
//何回もfunction contribute()を起動して、senderがownerよりcontributionsがmany many timesの状況になればownerになれてしまう

  function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }

  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }


  function withdraw() public onlyOwner {
    owner.transfer(address(this).balance);
  }

// this function is fallback function /you wanna send money to A contract 
  receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);//the best way attack become the owner
    //contributions条件を満たすことが攻撃の最初の準備。satisfy second condition first.
    owner = msg.sender;
  }
}
