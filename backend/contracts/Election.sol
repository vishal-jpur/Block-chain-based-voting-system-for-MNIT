//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

contract Election {
    mapping(address => bool) admins;                //store the data in the form of key-value pairs
    string name;                                   // name of the election. example: for president
    string description;                            // description of the election
    bool started;                                 //if the election is started 
    bool ended;                                   //if the election is ended

    constructor() {                              //initializes data member by invoking a constructor with no return type
        admins[msg.sender] = true;               
        started = false;
        ended = false;
    }

    modifier onlyAdmin() {
                                       //require(admins[msg.sender] == true, "Only Admin"); makes only admin mode
        _;                             //to specify when the function should be executed
    }

    function addAdmin(address _address) public onlyAdmin {
        admins[_address] = true;    //inputs the adress of etherium ethers ..is specifically designed to hold up to 20B
    }

    /*****************************CANDIDATES SECTION*****************************/

    struct Candidate {
        string name;            //holds name of the candidate
        string info;            //any information about the candidate
        bool exists;            //true if exists
    }
    mapping(string => Candidate) public candidates;            //stores candidate in key value pair
    string[] candidateNames;                                   //array of candidates name

    function addCandidate(string memory _candidateName, string memory _info)        //inputs each candidate name and his or her  info
        public
        onlyAdmin                                              //  displaying related data to admin to verify
    {
        Candidate memory newCandidate = Candidate({
            name: _candidateName,                        //inputs the candidate name in name 
            info: _info,                                  //inputs info
            exists: true                                 //exis=true
        });

        candidates[_candidateName] = newCandidate;         //if verified then push the candidate into created array of string
        candidateNames.push(_candidateName);              
    }

    function getCandidates() public view returns (string[] memory) {      //abstracts any tempering
        return candidateNames;
    }

    /*****************************CANDIDATES SECTION end*****************************/

    /*****************************ELECTION SECTION start*****************************/

    function setElectionDetails(string memory _name, string memory _description)
        public
        onlyAdmin                                  //sets election details only by admin
    {
        name = _name;                               //required details
        description = _description;
        started = true;
        ended = false;
    }

    function getElectionName() public view returns (string memory) {      //for public purpose 
        return name;
    }

    function getElectionDescription() public view returns (string memory) {
        return description;
    }

    function getTotalCandidates() public view returns (uint256) {
        return candidateNames.length;
    }

    /*****************************ELECTION SECTION ends*****************************/

    /*****************************VOTER SECTION*****************************/

    struct Vote {                            //each struct stores the voter id ,voter name and candidate
        address voterAddress;
        string voterId;
        string voterName;
        string candidate;
    }
    Vote[] votes;                            //all dynamically created vote
    mapping(string => bool) public voterIds;    //all voters details
    string[] votersArray;

    function vote(
        string memory _voterId,              // each given vote has stored voterid,votername,vote given to candidatename 
        string memory _voterName,
        string memory _candidateName 
    ) public {                                
        require(started == true && ended == false);
        require(candidates[_candidateName].exists, "No such candidate");
        require(!voterIds[_voterId], "Already Voted");      //abstaining voters from multiple voting
 
        Vote memory newVote = Vote({          //created newvote
            voterAddress: msg.sender,              
            voterId: _voterId,
            voterName: _voterName,
            candidate: _candidateName
        });

        votes.push(newVote);                //push the given vote and store the voterid and voter giving vote
        voterIds[_voterId] = true;
        votersArray.push(_voterId);
    }

    function getVoters() public view returns (string[] memory) {     //returns votersarray if called
        return votersArray;
    }

    /*****************************VOTER SECTION*****************************/

    function getVotes() public view onlyAdmin returns (Vote[] memory) {         //public display only admin view votes 
        return votes;
    }
 
    function getTotalVoter() public view returns (uint256) {                  // public display votes
        return votersArray.length;
    }

    function endElection() public onlyAdmin {                   //voting start and end only by the admin
        require(started == true && ended == false);

        started = true;
        ended = true;
    }

    function resetElection() public onlyAdmin {        //once voting got completed reseting the election
        require(started == true && ended == true);    

        for (uint32 i = 0; i < candidateNames.length; i++) {         //deleting any candidate
            delete candidates[candidateNames[i]];
        }

        for (uint32 i = 0; i < votersArray.length; i++) {        //deleting his voter id from maps key value pair
            delete voterIds[votersArray[i]];
        }

        name = "";
        description = "";

        delete votes;
        delete candidateNames;        
        delete votersArray;

        started = false;
        ended = false;
    }

    function getStatus() public view returns (string memory) {     //gives current status of the election
        if (started == true && ended == true) {                     //ended
            return "finished";
        }

        if (started == true && ended == false) {                 //currently running
            return "running";
        }

        return "not-started";                                     //not started
    }
}
