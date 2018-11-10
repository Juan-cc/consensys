pragma solidity ^0.4.20;

library EventEmitterLib {
    function emit(string s) public{
        emit Emit(s);
    }
    
    event Emit(string s);
}

contract EventEmitterContract {
    using EventEmitterLib for string;
    
    function emit(string s) public {
        s.emit();
    }
    
    event Emit(string s);
}