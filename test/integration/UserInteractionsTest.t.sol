// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Flamelings} from "../../src/Flamelings.sol";
import {DeployFlamelings} from "../../script/DeployFlamelings.s.sol";
import {IERC20, ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {MintNfts, TransferNft, ApproveNft} from "../../script/UserInteractions.s.sol";

contract UserInteractionsTest is Test {
    Flamelings nftContract;
    IERC20 token;

    address USER = makeAddr("user");
    address OWNER;
    uint256 constant STARTING_BALANCE = 10_000_000 * 10 ** 18;

    modifier fundedAndApproved() {
        // fund user
        vm.prank(OWNER);
        token.transfer(msg.sender, STARTING_BALANCE);
        vm.prank(msg.sender);
        token.approve(address(nftContract), STARTING_BALANCE);
        _;
    }

    function setUp() external {
        DeployFlamelings deployment = new DeployFlamelings();
        nftContract = deployment.run();
        token = IERC20(nftContract.getPaymentToken());
        OWNER = nftContract.owner();
    }

    function testUserCanMintSingleNft() public fundedAndApproved {
        MintNfts mintNfts = new MintNfts();
        mintNfts.mintSingleNft(address(nftContract));

        assert(nftContract.balanceOf(msg.sender) == 1);
    }

    function testUserCanMintMultipleNfts() public fundedAndApproved {
        MintNfts mintNfts = new MintNfts();
        mintNfts.mintMultipleNfts(address(nftContract));

        assert(nftContract.balanceOf(msg.sender) == 3);
    }

    function testUserCanTransferNft() public fundedAndApproved {
        vm.prank(msg.sender);
        nftContract.mint(1);
        assert(nftContract.balanceOf(msg.sender) == 1);

        TransferNft transferNft = new TransferNft();
        transferNft.transferNft(address(nftContract));
        assert(nftContract.balanceOf(msg.sender) == 0);
    }

    function testUserCanApproveNft() public fundedAndApproved {
        vm.prank(msg.sender);
        nftContract.mint(1);
        ApproveNft approveNft = new ApproveNft();
        approveNft.approveNft(address(nftContract));

        assert(nftContract.getApproved(0) == makeAddr("sender"));
    }
}
