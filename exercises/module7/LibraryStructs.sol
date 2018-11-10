pragma solidity ^0.4.20;

library CounterLib {
    struct Counter { uint i; }
    
    function incremented(Counter storage self) public returns (uint) {
        return ++self.i;
    }
}

contract CounterContract {
    using CounterLib for CounterLib.Counter; 
    CounterLib.Counter counter;

    function increment() public returns (uint) {
        return counter.incremented();
    }
}