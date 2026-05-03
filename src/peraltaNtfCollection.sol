// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {
    Strings
} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

error NoSupport();

contract peraltaNftCollection is ERC721 {
    using Strings for uint256; // manera de utilizar nuestras libreriasen un tipo de datos especifico

    uint256 public totalSupply_;
    uint256 public currentIdToken_;
    string public baseURI_;

    event mintNFT(address to, uint256 tokenId);
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 totalsupply,
        string memory baseURI
    ) ERC721(name_, symbol_) {
        totalSupply_ = totalsupply;
        baseURI_ = baseURI;
    }

    function mint() external {
        if (currentIdToken_ >= totalSupply_) revert NoSupport();

        _safeMint(msg.sender, currentIdToken_);

        currentIdToken_++;

        emit mintNFT(msg.sender, currentIdToken_--);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI_;
    }
    // funcion que concatena el string para generar ipsf://2qsdlfnsldflanbfoajbsfaf/1.jso
    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return
            bytes(baseURI).length > 0
                ? string.concat(baseURI, tokenId.toString(), ".json")
                : "";
    }
}
