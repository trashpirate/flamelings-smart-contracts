// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Flamelings} from "../../src/Flamelings.sol";
import {DeployFlamelings} from "../../script/DeployFlamelings.s.sol";
import {IERC20, ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FlamelingsTest is Test {
    Flamelings nfts;
    IERC20 token;

    address USER = makeAddr("user");
    address NEW_FEE_ADDRESS = makeAddr("fee");
    address OWNER;

    uint256 constant STARTING_BALANCE = 500_000 * 10 ** 18;
    uint256 constant INITIAL_FEE = 100_000 * 10 ** 18;
    uint256 constant NEW_FEE = 200_000 * 10 ** 18;

    modifier funded() {
        // fund user
        vm.prank(OWNER);
        token.transfer(USER, STARTING_BALANCE);
        _;
    }

    function setUp() external {
        DeployFlamelings deployment = new DeployFlamelings();
        nfts = deployment.run();
        token = IERC20(nfts.getPaymentToken());

        OWNER = nfts.owner();
    }

    function testPaymentTokenName() public {
        address tokenAddress = nfts.getPaymentToken();
        string memory symbol = ERC20(tokenAddress).symbol();
        assertEq(symbol, "EARN");
    }

    function testNFTTokenName() public {
        assertEq(nfts.name(), "Flamelings");
    }

    function testNFTTokenSymbol() public {
        assertEq(nfts.symbol(), "FLAMELING");
    }

    function testNFTprice() public {
        assertEq(nfts.getFee(), INITIAL_FEE);
    }

    function testIfOwnerCanSetFee() public {
        vm.prank(OWNER);
        nfts.setFee(NEW_FEE);
        assertEq(nfts.getFee(), NEW_FEE);
    }

    function testIfOwnerCanSetFeeAddress() public {
        vm.prank(OWNER);
        nfts.setFeeAddress(NEW_FEE_ADDRESS);
        assertEq(nfts.getFeeAddress(), NEW_FEE_ADDRESS);
    }

    function testIfOwnerCanSetBatchLimit() public {
        vm.prank(OWNER);
        nfts.setBatchLimit(3);
        assertEq(nfts.getBatchLimit(), 3);
    }

    function testIfOwnerCanSetMaxPerWallet() public {
        vm.prank(OWNER);
        nfts.setMaxPerWallet(11);
        assertEq(nfts.getMaxPerWallet(), 11);
    }

    function testRevertWhenBatchLimitGreaterThankMaxPerWallet() public {
        vm.expectRevert();
        vm.prank(OWNER);
        nfts.setBatchLimit(11);
    }

    function testRevertWhenMaxPerWalletSmallerThanBatchLimit() public {
        vm.expectRevert();
        vm.prank(OWNER);
        nfts.setMaxPerWallet(3);
    }

    function testIfOwnerCanWithdrawTokens() public funded {
        vm.prank(USER);
        token.transfer(address(nfts), STARTING_BALANCE / 2);
        uint256 contractBalance = token.balanceOf(address(nfts));
        assertGt(contractBalance, 0);

        uint256 initialBalance = token.balanceOf(OWNER);
        vm.prank(OWNER);
        nfts.withdrawTokens(address(token), OWNER);
        uint256 newBalance = token.balanceOf(OWNER);

        assertEq(token.balanceOf(address(nfts)), 0);
        assertGt(newBalance, initialBalance);
    }

    function testSetFeeRevertsIfNotOwner() public {
        vm.prank(USER);

        vm.expectRevert();
        nfts.setFee(NEW_FEE);
    }

    function testSetFeeAddressRevertsIfNotOwner() public {
        vm.prank(USER);

        vm.expectRevert();
        nfts.setFeeAddress(NEW_FEE_ADDRESS);
    }

    function testSetBatchLimitRevertsIfNotOwner() public {
        vm.prank(USER);

        vm.expectRevert();
        nfts.setBatchLimit(10);
    }

    function testSetMaxPerWalletRevertsIfNotOwner() public {
        vm.prank(USER);

        vm.expectRevert();
        nfts.setMaxPerWallet(100);
    }

    function testWithdrawTokensRevertsIfNotOwner() public funded {
        vm.prank(USER);
        token.transfer(address(nfts), STARTING_BALANCE / 2);
        uint256 contractBalance = token.balanceOf(address(nfts));
        assertGt(contractBalance, 0);

        vm.expectRevert();
        vm.prank(USER);
        nfts.withdrawTokens(address(token), USER);
    }

    function testMintSingleNFT() public funded {
        uint256 fee = nfts.getFee();
        vm.prank(USER);
        token.approve(address(nfts), fee);

        vm.prank(USER);
        nfts.mint(1);
        assertEq(nfts.balanceOf(USER), 1);
    }

    function testMintMultipleNFTs() public funded {
        uint256 fee = 3 * nfts.getFee();
        vm.prank(USER);
        token.approve(address(nfts), fee);

        vm.prank(USER);
        nfts.mint(3);
        assertEq(nfts.balanceOf(USER), 3);
    }

    function testRetrieveTokenUri() public funded {
        uint256 fee = nfts.getFee();
        vm.prank(USER);
        token.approve(address(nfts), fee);

        vm.prank(USER);
        nfts.mint(1);
        assertEq(nfts.balanceOf(USER), 1);

        console.log(nfts.tokenURI(0));
    }

    function testChargesCorrectAmount() public funded {
        uint256 fee = 3 * nfts.getFee();
        uint256 initialBalance = token.balanceOf(USER);
        uint256 expectedBalance = initialBalance - fee;

        vm.prank(USER);
        token.approve(address(nfts), fee);

        vm.prank(USER);
        nfts.mint(3);

        assertEq(token.balanceOf(USER), expectedBalance);
    }

    function testMintRevertsIfZero() public funded {
        uint256 fee = nfts.getFee();

        vm.prank(USER);
        token.approve(address(nfts), fee);

        vm.expectRevert();
        vm.prank(USER);
        nfts.mint(0);
    }

    function testMintRevertsIfExceedsBatchLimit() public funded {
        vm.prank(OWNER);
        nfts.setBatchLimit(5);

        uint256 fee = 6 * nfts.getFee();
        vm.prank(USER);
        token.approve(address(nfts), fee);

        vm.expectRevert();
        vm.prank(USER);
        nfts.mint(6);
    }

    function testMintRevertsIfExceedsMaxWalletLimit() public funded {
        uint256 fee = 6 * nfts.getFee();
        vm.prank(USER);
        token.approve(address(nfts), fee);

        vm.expectRevert();
        vm.prank(USER);
        nfts.mint(6);
    }

    function testRevertsIfMaxExceeded() public funded {
        vm.prank(OWNER);
        nfts.setMaxPerWallet(1000);
        vm.prank(OWNER);
        nfts.setBatchLimit(100);

        uint256 fee = 100 * nfts.getFee();
        for (uint256 index = 0; index < 10; index++) {
            vm.prank(OWNER);
            token.approve(address(nfts), fee);

            vm.prank(OWNER);
            nfts.mint(100);
        }

        fee = nfts.getFee();
        vm.prank(USER);
        token.approve(address(nfts), fee);

        vm.expectRevert();
        vm.prank(USER);
        nfts.mint(1);
    }

    function testRevertIfInsufficientBalance() public funded {
        uint256 userBalance = token.balanceOf(USER);
        vm.prank(USER);
        token.approve(address(nfts), userBalance);

        vm.expectRevert();
        vm.prank(USER);
        nfts.mint(7);
    }
}
