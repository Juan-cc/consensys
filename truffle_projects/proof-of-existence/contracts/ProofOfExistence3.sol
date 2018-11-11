pragma solidity ^0.4.22;


contract ProofOfExistence3 {

    mapping (bytes32 => bool) private proofs;
    
    // store a proof of existence in the contract state
    function storeProof(bytes32 proof) private {
        proofs[proof] = true;
    }
    
    // calculate and store the proof for a document
    function notarize(string document) public {
        var proof = proofFor(document);
        storeProof(proof);
    }
    
    // helper function to get a document's sha256
    function proofFor(string document) public pure returns (bytes32) {
        return sha256(document);
    }
    
    // check if a document has been notarized
    function checkDocument(string document) public view returns (bool) {
        var proof = proofFor(document);
        return hasProof(proof);
    }

    // returns true if proof is stored
    function hasProof(bytes32 proof) public view returns(bool) {
        return proofs[proof];
    }
}