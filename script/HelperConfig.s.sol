// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {HoldEarn} from "../src/HoldEarn.sol";

contract HelperConfig is Script {
    // EARN deployment arguments
    address public constant TOKENOWNER = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    // chain configurations
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address initialOwner;
        address feeAddress;
        address tokenAddress;
    }

    constructor() {
        if (block.chainid == 1) {
            activeNetworkConfig = getMainnetConfig();
        } else if (block.chainid == 11155111) {
            activeNetworkConfig = getTestnetConfig();
        } else {
            activeNetworkConfig = getAnvilConfig();
        }
    }

    function getTestnetConfig() public pure returns (NetworkConfig memory) {
        return NetworkConfig({
            initialOwner: 0xCbA52038BF0814bC586deE7C061D6cb8B203f8e1,
            feeAddress: 0xCbA52038BF0814bC586deE7C061D6cb8B203f8e1,
            tokenAddress: 0x09601E2bfA5b0101e0ba151541d95646B1eeE381
        });
    }

    function getMainnetConfig() public pure returns (NetworkConfig memory) {
        return NetworkConfig({
            initialOwner: 0x4671a210C4CF44C43dC5E44DAf68e64D46cdc703,
            feeAddress: 0x0cf66382d52C2D6c1D095c536c16c203117E2B2f,
            tokenAddress: 0x0b61C4f33BCdEF83359ab97673Cb5961c6435F4E
        });
    }

    function getAnvilConfig() public returns (NetworkConfig memory) {
        // Deploy mock contract
        vm.startBroadcast();

        HoldEarn token = new HoldEarn(TOKENOWNER);
        vm.stopBroadcast();
        return NetworkConfig({
            initialOwner: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266,
            feeAddress: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266,
            tokenAddress: address(token)
        });
    }
}
