-include .env

.PHONY: all test clean deploy-anvil

slither :; slither ./src 

anvil :; anvil -m 'test test test test test test test test test test test junk'

anvil-mainnet :; @anvil --fork-url ${RPC_MAINNET} --fork-block-number 18810000 --fork-chain-id 1 --chain-id 123

# use the "@" to hide the command from your shell, use contract=<contract name>
deploy-testnet :; @forge script script/Deploy${contract}.s.sol:Deploy${contract} --rpc-url ${network}  --account Testing --sender 0x7Bb8be3D9015682d7AC0Ea377dC0c92B0ba152eF --broadcast --verify --etherscan-api-key ${network} --watch
deploy-testnet-simulate :; @forge script script/Deploy${contract}.s.sol:Deploy${contract} --rpc-url ${network}  --account Testing --sender 0x7Bb8be3D9015682d7AC0Ea377dC0c92B0ba152eF --watch

deploy-mainnet :; @forge script script/Deploy${contract}.s.sol:Deploy${contract} --rpc-url ${network}  --account ${account} --sender ${sender} --broadcast --verify --etherscan-api-key ${network}  --watch -vvvv
deploy-mainnet-simulate :; @forge script script/Deploy${contract}.s.sol:Deploy${contract} --rpc-url ${network}  --account ${account} --sender ${sender}  -vvvv

# This is the private key of account from the mnemonic from the "make anvil" command
deploy-anvil :; @forge script script/DeployFlamelings.s.sol:DeployFlamelings --rpc-url http://localhost:8545  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast 

test-local-all :; @forge test --rpc-url localhost --gas-report

fuzz-test-local :; @forge test --match-path test/fuzz/* --rpc-url localhost

unit-test-local :; @forge test --match-path test/unit/* --rpc-url localhost -vvv --gas-report

integration-test-local :; @forge test --match-path test/integration/* --rpc-url localhost -vvv
integration-test-user :; @forge test --match-path test/integration/UserInteractionsTest.t.sol --rpc-url localhost -vvv
integration-test-owner :; @forge test --match-path test/integration/OwnerInteractionsTest.t.sol --rpc-url localhost -vvv

-include ${FCT_PLUGIN_PATH}/makefile-external