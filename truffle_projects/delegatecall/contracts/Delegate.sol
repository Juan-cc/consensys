pragma solidity ^0.4.11;

contract Delegate{
    address public delegateContract; // Although I don't need this value, we need 
    // to map Main's storage location so we need to copy all it's members
    uint256 public total;

    function add(uint256 var1, uint256 var2) public {
        total = var1 + var2;
    }
}

contract AMain{
   function delegateAdd()  public{
        address  delegateContract = new Delegated();
        assert(delegateContract.delegatecall(bytes4(
            keccak256("someMethod(uint256,uint256,string)")), 
            100, 200, "Hello Crypto!"));    
   }
   
    function encodeAbi()  public{
        address  delegateContract = new Delegated();
        assert(delegateContract.delegatecall(
            abi.encodeWithSignature("someMethod(uint256,uint256,string)", 
            100, 200, "Hello Crypto!")));    
   }
}

contract ADelegated{

    event DelegateEvent(uint256, string);
    event MessageEvent(address, uint256, bytes);
    
    function someMethod(uint256 var1, uint256 var2, string var3)   public {
        emit DelegateEvent(var1 + var2, var3);
        emit MessageEvent(msg.sender, msg.value, msg.data);
    }
}
