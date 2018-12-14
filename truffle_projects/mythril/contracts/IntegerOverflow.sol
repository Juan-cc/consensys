pragma solidity ^0.4.21;

contract EthWrapperToken {

    uint public totalSupply;
    mapping (address => uint256) public balanceOf;

  
    function transfer(address _to, uint256 _value) public{
        // Check if sender has balance
        require(balanceOf[msg.sender] - _value >= 0, "Possible Integer overflow");
        // Add and subtract new balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        require(this.balance == totalSupply, "We won't reach this point if Overflow occurs");
    }

}