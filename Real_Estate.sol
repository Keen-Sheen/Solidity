pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/SafeMath.sol";

contract RealEstateEscrow is ERC721 {
    using SafeMath for uint256;

    address public seller;
    address public buyer;
    uint256 public escrowAmount;
    bool public escrowClosed;

    constructor(address _seller, address _buyer, uint256 _escrowAmount) public {
        seller = _seller;
        buyer = _buyer;
        escrowAmount = _escrowAmount;
        escrowClosed = false;
    }

    function deposit() public payable {
        require(msg.sender == buyer, "Only the buyer can deposit funds.");
        require(msg.value == escrowAmount, "Incorrect deposit amount.");
        seller.transfer(escrowAmount);
    }

    function release() public {
        require(msg.sender == seller, "Only the seller can release the funds.");
        require(escrowClosed, "Escrow must be closed before releasing funds.");
        buyer.transfer(escrowAmount);
    }

    function close() public {
        require(msg.sender == buyer, "Only the buyer can close the escrow.");
        escrowClosed = true;
    }
}
