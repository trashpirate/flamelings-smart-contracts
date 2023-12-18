// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Flamelings} from "../../src/Flamelings.sol";
import {DeployFlamelings} from "../../script/DeployFlamelings.s.sol";
import {IERC20, ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {
    SetNewFee,
    SetNewFeeAddress,
    SetNewMaxPerWallet,
    SetNewBatchLimit,
    WithdrawTokensFromContract
} from "../../script/OwnerInteractions.s.sol";

contract OwnerInteractionsTest is Test {
    Flamelings nftContract;
    IERC20 token;

    address USER = makeAddr("user");
    address NEW_FEE_ADDRESS = makeAddr("fee");
    address OWNER;
    uint256 constant TOKEN_BALANCE = 100_000 * 10 ** 18;

    uint256 constant INITIAL_FEE = 100_000 * 10 ** 18;
    uint256 constant NEW_FEE = 200_000 * 10 ** 18;

    function setUp() external {
        DeployFlamelings deployment = new DeployFlamelings();
        nftContract = deployment.run();
        token = IERC20(nftContract.getPaymentToken());
        OWNER = nftContract.owner();
        vm.prank(OWNER);
        nftContract.transferOwnership(msg.sender);
    }

    function testOwnerCanSetFee() public {
        SetNewFee setNewFee = new SetNewFee();
        setNewFee.setNewFee(address(nftContract));
    }

    function testOwnerCanSetFeeAddress() public {
        SetNewFeeAddress setNewFeeAddress = new SetNewFeeAddress();
        setNewFeeAddress.setNewFeeAddress(address(nftContract));
    }

    function testOwnerCanSetMaxPerWallet() public {
        SetNewMaxPerWallet setNewMaxPerWallet = new SetNewMaxPerWallet();
        setNewMaxPerWallet.setNewMaxPerWallet(address(nftContract));
    }

    function testOwnerCanSetBatchLimit() public {
        SetNewBatchLimit setNewBatchLimit = new SetNewBatchLimit();
        setNewBatchLimit.setNewBatchLimit(address(nftContract));
    }

    function testOwnerWithdrawTokens() public {
        vm.prank(OWNER);
        token.transfer(address(nftContract), TOKEN_BALANCE);
        WithdrawTokensFromContract withdrawTokensFromContract = new WithdrawTokensFromContract();
        withdrawTokensFromContract.withrawTokensFromContract(address(nftContract));
    }
}
