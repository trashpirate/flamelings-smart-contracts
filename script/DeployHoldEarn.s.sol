// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {HoldEarn} from "../src/HoldEarn.sol";

contract DeployHoldEarn is Script {
    address tokenOwner = 0xCbA52038BF0814bC586deE7C061D6cb8B203f8e1;

    function run() external returns (HoldEarn) {
        vm.startBroadcast();
        HoldEarn token = new HoldEarn(tokenOwner);
        vm.stopBroadcast();
        return token;
    }
}
