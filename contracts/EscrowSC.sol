pragma solidity 0.8.17;

contract escrow{

  address public depositor;
  address public beneficiary;
  address payable private arbiter;

modifier onlyArbiter {
   require(msg.sender == arbiter, "not called by arbiter");
   _;
 }

    event Approved(uint256);

 constructor(address _arbiter, address _beneficiary) payable {
    arbiter = payable(_arbiter);
    beneficiary = _beneficiary;
    depositor = msg.sender;
  }

fucntion approve() external onlyArbiter {
  uint256 balance = address(this).balance;
    (bool sent, ) = beneficiary.call{ value: balance }("");
		require(sent, "Failed to send Ether");
		isApproved = true;
     emit Approved(balance);
  }




















}