pragma solidity ^0.5.0;

contract BankAccount {
    address payable accountOwner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function withdraw(uint amount, address payable recipient) public {
       require(recipient == accountOwner, "Get OUt!");
       return recipient.transfer(amount);

    }
   function deposit() public payable {}

   function() external payable {} 
}