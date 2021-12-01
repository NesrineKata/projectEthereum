pragma solidity ^0.5.0;

contract Election {
 // Read/write candidate
 string public candidate;


 // Model a Candidate
 struct Candidate  {
 uint id;
 string name;
 uint voteCount;
 }
//mapping(address =>bool) public comptes;
// Read/write Candidates
 mapping(uint => Candidate) public candidates;
uint public compte =0;
 // Store Candidates Count
uint public candidatesCount;
 // Store accounts that have voted
mapping(address=> bool) public voters;
 // Constructor
 constructor() public {
  addCandidate("candidate 1");
  addCandidate("candidate 2");
  addCandidate("candidate 3");

 }
 /*
 function addAccount() public  {
     if(compte<2){
        compte++;
        comptes[msg.sender]=true;
     }
     console.log(comptes);
 }

 function verifyAccount() public   returns (bool)  {
    if(comptes[msg.sender]==true){
        return true;
    }
    else 
        return false;
     /*for(uint i=0;i<accounts.length;i++){
         if(keccak256(abi.encodePacked(accounts[i])) == keccak256(abi.encodePacked(ad)))
            return true;
     }
     return false;
   
 }
 */
 
 function addCandidate (string memory name) public {
 candidatesCount ++;
 candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
 }

function vote (uint _candidateId) public {
 // require that they haven't voted before
 require(!voters[msg.sender]);
 // require a valid candidate
 require(_candidateId > 0 && _candidateId <= candidatesCount);
 // record that voter has voted
 voters[msg.sender] = true;
 // update candidate vote Count
 candidates[_candidateId].voteCount ++;
 // trigger voted event
 emit votedEvent(_candidateId);
}
event votedEvent (
 uint indexed _candidateId
 );
}
