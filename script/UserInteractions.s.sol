// SPDX-License-Identifier: MIT

/*

mint(uint256 quantity)
transferFrom(
        address from,
        address to,
        uint256 tokenId
    )
safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    )
approve(address to, uint256 tokenId)

*/

pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {Flamelings} from "../src/Flamelings.sol";

contract MintNfts is Script {
    function mintSingleNft(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).mint(1);
        vm.stopBroadcast();
        console.log("Minted 1 NFT with:", msg.sender);
    }

    function mintMultipleNfts(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).mint(3);
        vm.stopBroadcast();
        console.log("Minted 3 NFT with:", msg.sender);
    }

    function run() external {
        address recentContractAddress = DevOpsTools.get_most_recent_deployment("Flamelings", block.chainid);
        mintSingleNft(recentContractAddress);
        mintMultipleNfts(recentContractAddress);
    }
}

contract TransferNft is Script {
    address NEW_USER = makeAddr("new-user");

    function transferNft(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).transferFrom(tx.origin, NEW_USER, 0);
        vm.stopBroadcast();
    }

    function run() external {
        address recentContractAddress = DevOpsTools.get_most_recent_deployment("Flamelings", block.chainid);
        transferNft(recentContractAddress);
    }
}

contract ApproveNft is Script {
    address SENDER = makeAddr("sender");

    function approveNft(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).approve(SENDER, 0);
        vm.stopBroadcast();
    }

    function run() external {
        address recentContractAddress = DevOpsTools.get_most_recent_deployment("Flamelings", block.chainid);
        approveNft(recentContractAddress);
    }
}
