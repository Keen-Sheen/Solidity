pragma solidity ^0.5.0;

contract BankAccount {
    address payable accountOwner = 0xd8d55d7eca398dc213bfe30a2a24059693e2fa3c0e008fb075d5f492118a7d26;

    function withdrawl(uint amount, address payable recipient) public {
        require(recipient == accountOwner, "Not your money!");
        return recipient.transfer(amount);

    }
    function deposit() public payable {}

    function() external payable {}
}