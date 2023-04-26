// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.3/contracts/token/ERC721/ERC721.sol";

interface IERC5192 {
    event Locked(uint256 tokenId);
    event Unlocked(uint256 tokenId);
    function locked(uint256 tokenId) external view returns (bool);
}

abstract contract ERC5192 is ERC721, IERC5192 {
    mapping(uint256 tokenId => bool isLocked) private _islocked;

    function locked(uint256 tokenId) external view returns (bool) {
        _requireMinted(tokenId);
        return _islocked[tokenId];
    }

    function supportsInterface(bytes4 interfaceId) public view override returns (bool) {
        return interfaceId == type(IERC5192).interfaceId || super.supportsInterface(interfaceId);
    }

    function _beforeTokenTransfer(
        address from, address to, uint256 tokenId
    )   internal view override {
        require(_islocked[tokenId] == false, "ERC5192: Locked");
    }

    function _lock(uint256 tokenId) internal {
        _islocked[tokenId] = true;
        emit Locked(tokenId);
    }

    function _unlock(uint256 tokenId) internal {
        _islocked[tokenId] = false;
        emit Unlocked(tokenId);
    }
}

contract Mycollection is ERC721 {
    constructor() ERC721("CollectionName", "Symbol") {
        _mint(_msgSender(), 1);
        _lock(1);
    }
}
