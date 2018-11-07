pragma solidity ^0.4.17;

contract Adoption{
    
    event PetAdoptedEvent(
        uint256 indexed petId, 
        address indexed adopter    
    );
    
    modifier isValidPet(uint256 id){
        require(id >= 0 && id <=15, "PetId out of range.");
        require(adopters[id] == 0, "Pet already adopted, sorry!");
        _;
    }
    
    address[16] public adopters; // Array index are petId.
    
    
    function adopt(uint256 petId) isValidPet(petId) public returns (uint256) {
        adopters[petId] = msg.sender;
        emit PetAdoptedEvent(petId, msg.sender);
        return petId;
    }
    
    
    function getAdopters() public view returns(address[16]){
        return adopters;
    }
    
}