pragma solidity ^0.4.11;

contract Main{
    address public delegateContract;
    uint256 public total;
    
    function setDelegateAddress(address delegate) public {
        delegateContract = delegate;
    }

        /* DELEGATECALL is executed in the context of Main.sol
        
        DELEGATECALL basically says that I'm a contract and I'm allowing (delegating) you to do whatever you want to my storage.  DELEGATECALL is a security risk for the sending contract which needs to trust that the receiving contract will treat the storage well.

        DELEGATECALL was a new opcode that was a bug fix for CALLCODE which did not preserve msg.sender and msg.value. If Alice invokes Bob who does DELEGATECALL to Charlie, the msg.sender in the DELEGATECALL is Alice (whereas if CALLCODE was used the msg.sender would be Bob).

        Details
        When D does CALL on E, the code runs in the context of E: the storage of E is used.

        When D does CALLCODE on E, the code runs in the context of D. So imagine that the code of E is in D. Whenever the code writes to storage, it writes to the storage of account D, instead of E.*/
    function delegateAdd(uint256 var1, uint256 var2) public{
        assert(delegateContract.delegatecall(bytes4(sha3("add(uint256,uint256)")), var1, var2));
    }

    /* CALL is executed in the context of Delegate.sol
    */
    function callAdd(uint256 var1, uint256 var2) public {
        assert(delegateContract.call(bytes4(sha3("add(uint256,uint256)")), var1, var2));
    }
}