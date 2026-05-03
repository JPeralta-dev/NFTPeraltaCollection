// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import {Script} from "forge-std/Script.sol";
import {peraltaNftCollection} from "../src/peraltaNtfCollection.sol";
contract DeployNFTCollection is Script {
    function run() external returns (peraltaNftCollection) {
        uint deployAdressWalletUint = vm.envInt("PRIVATE_KEY");
        vm.startBroadcast(deployAdressWalletUint);
        string memory name_ = "NFTPERALTA";
        string memory symbol_ = "NFP";
        uint totalSupply_ = 2;
        string
            memory baseURI_ = "ipfs;//bafybeifm3yw4w35nqlvxqaohq7rqg5mv7zaum6u2b7sh5m4zvzb2uljpp4";
        peraltaNftCollection nftCollection = new peraltaNftCollection(
            name_,
            symbol_,
            totalSupply_,
            baseURI_
        );
        vm.startBroadcast();
        return nftCollection;
    }
}
