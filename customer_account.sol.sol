pragma solidity ^0.5.0;

contract CustomerAccount {
    address owner;
    address payable authorizedRecipient;
    bool isNewAccount;
    uint public accountBalance;
    string customerName;
    string customerLastName;

    function getInfo() view public returns(address, bool, uint, address payable, string memory, string memory) {
        return (owner,isNewAccount, accountBalance, authorizedRecipient, customerName, customerLastName);
    }
    function setInfo (address newOwner, bool newAccountStatus, string memory newCustomerLastname, address payable newAuthorizedRecipient, uint newAccountBalance, string memory newCustomerName) public {
        owner = newOwner;
        isNewAccount = newAccountStatus;
        authorizedRecipient = newAuthorizedRecipient;
        accountBalance = newAccountBalance;
        customerName = newCustomerName;
        customerLastName = newCustomerLastname;

    }
    function sendRemittance(uint amount, address payable recipient) public {
        require(recipient == owner || recipient == authorizedRecipient, "The recipient address is not authorized!");
        recipient.transfer(amount);
        accountBalance = address(this).balance;
    }
    function deposit() public payable {
        accountBalance = address(this).balance;
    }
    function() external payable {}
}