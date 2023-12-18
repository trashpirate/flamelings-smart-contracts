// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {Flamelings} from "../src/Flamelings.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFlamelings is Script {
    string baseUri = "ipfs://bafybeic2a7jdsztni6jsnq2oarb3o5g7iuya5r4lcjfqi64rsucirdfobm/";

    function run() external returns (Flamelings) {
        HelperConfig helperConfig = new HelperConfig();
        (address initialOwner, address feeAddress, address tokenAddress) = helperConfig.activeNetworkConfig();

        // after broadcast is real transaction, before just simulation
        vm.startBroadcast();
        Flamelings nfts = new Flamelings(initialOwner, feeAddress, tokenAddress, baseUri);
        vm.stopBroadcast();
        return nfts;
    }
}
