pragma solidity ^0.4.11;

contract Delegate{
    address public delegateContract; // Although I don't need this value, we need to map Main's storage location so we need to copy all it's members
    uint256 public total;

    function add(uint256 var1, uint256 var2) public {
        total = var1 + var2;
    }
}