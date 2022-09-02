// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;        //starting solidity

contract Migrations {                     //connecting server
  address public owner = msg.sender;
  uint public last_completed_migration;

  modifier restricted() {
    require(
      msg.sender == owner,                      //owner only mode
      "This function is restricted to the contract's owner"
    );
    _;
  }

  function setCompleted(uint completed) public restricted {               //end the results
    last_completed_migration = completed;
  }
}
