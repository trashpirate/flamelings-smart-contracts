// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Flamelings} from "../src/Flamelings.sol";

contract SetNewFee is Script {
    uint256 constant NEW_FEE = 15_000_000_000 * 10 ** 9;
    address NEW_FEE_ADDRESS = makeAddr("new-fee-address");
    uint256 constant NEW_MAX_PER_WALLET = 10;
    uint256 constant NEW_BATCH_LIMIT = 10;
    IERC20 token;

    function setNewFee(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).setFee(NEW_FEE);
        vm.stopBroadcast();
    }

    function run() external {
        address recentContractAddress = DevOpsTools.get_most_recent_deployment("Flamelings", block.chainid);
        setNewFee(recentContractAddress);
    }
}

contract SetNewFeeAddress is Script {
    uint256 constant NEW_FEE = 15_000_000_000 * 10 ** 9;
    address NEW_FEE_ADDRESS = makeAddr("new-fee-address");
    uint256 constant NEW_MAX_PER_WALLET = 10;
    uint256 constant NEW_BATCH_LIMIT = 10;
    IERC20 token;

    function setNewFeeAddress(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).setFeeAddress(NEW_FEE_ADDRESS);
        vm.stopBroadcast();
    }

    function run() external {
        address recentContractAddress = DevOpsTools.get_most_recent_deployment("Flamelings", block.chainid);

        setNewFeeAddress(recentContractAddress);
    }
}

contract SetNewMaxPerWallet is Script {
    uint256 constant NEW_FEE = 15_000_000_000 * 10 ** 9;
    address NEW_FEE_ADDRESS = makeAddr("new-fee-address");
    uint256 constant NEW_MAX_PER_WALLET = 10;
    uint256 constant NEW_BATCH_LIMIT = 10;
    IERC20 token;

    function setNewMaxPerWallet(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).setMaxPerWallet(NEW_MAX_PER_WALLET);
        vm.stopBroadcast();
    }

    function run() external {
        address recentContractAddress = DevOpsTools.get_most_recent_deployment("Flamelings", block.chainid);
        setNewMaxPerWallet(recentContractAddress);
    }
}

contract SetNewBatchLimit is Script {
    uint256 constant NEW_FEE = 15_000_000_000 * 10 ** 9;
    address NEW_FEE_ADDRESS = makeAddr("new-fee-address");
    uint256 constant NEW_MAX_PER_WALLET = 10;
    uint256 constant NEW_BATCH_LIMIT = 3;
    IERC20 token;

    function setNewBatchLimit(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).setBatchLimit(NEW_BATCH_LIMIT);
        vm.stopBroadcast();
    }

    function run() external {
        address recentContractAddress = DevOpsTools.get_most_recent_deployment("Flamelings", block.chainid);
        setNewBatchLimit(recentContractAddress);
    }
}

contract WithdrawTokensFromContract is Script {
    uint256 constant NEW_FEE = 15_000_000_000 * 10 ** 9;
    address NEW_FEE_ADDRESS = makeAddr("new-fee-address");
    uint256 constant NEW_MAX_PER_WALLET = 10;
    uint256 constant NEW_BATCH_LIMIT = 10;
    IERC20 token;

    function withrawTokensFromContract(address recentContractAddress) public {
        vm.startBroadcast();
        Flamelings(recentContractAddress).withdrawTokens(
            Flamelings(recentContractAddress).getPaymentToken(), address(this)
        );
        vm.stopBroadcast();
    }

    function run() external {
        address recentContractAddress = DevOpsTools.get_most_recent_deployment("Flamelings", block.chainid);
        withrawTokensFromContract(recentContractAddress);
    }
}
