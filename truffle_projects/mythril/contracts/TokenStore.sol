pragma solidity ^0.4.21;

import "./EIP20.sol";

contract TokenStore {

    uint public price;
    EIP20 public token;      //is an ERC20 token
    address public owner;

    function TokenStore() public {
        owner = msg.sender;
    }

    function updatePrice(uint _price) public{
        if( msg.sender == owner ) {
            price = _price;
        }
    }

    function buy(uint quant) public payable returns(uint) {
        require(msg.value > quant * price, "some message");
        token.transfer(msg.sender, msg.value/price);
    }

}