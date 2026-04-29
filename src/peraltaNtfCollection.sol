// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

error NoSupport();

contract peraltaNftCollection is ERC721 {
    uint256 public totalSupply_;
    uint256 public currentIdToken_;

    event mintNFT(address to, uint256 tokenId);
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 totalsupply
    ) ERC721(name_, symbol_) {
        totalSupply_ = totalsupply;
    }

    function mint() external {
        if (currentIdToken_ >= totalSupply_) revert NoSupport();

        _safeMint(msg.sender, currentIdToken_);

        currentIdToken_++;

        emit mintNFT(msg.sender, currentIdToken_--);
    }
}
