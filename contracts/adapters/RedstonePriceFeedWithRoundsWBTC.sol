// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import  "../RedStoneBaseContracts/redstone-oracles-monorepo/packages/on-chain-relayer/contracts/price-feeds/with-rounds/MergedPriceFeedAdapterWithRounds.sol";

contract RedstonePriceFeedWithRoundsWBTC is MergedPriceFeedAdapterWithRounds {

  bytes32 constant private WBTC_ID = bytes32("WBTC");

  error UpdaterNotAuthorised(address signer);


  // By default, we have 3 seconds between the updates, but in the REya Use Case
  // We need to set it to 0 to avoid conflicts between users
  function getMinIntervalBetweenUpdates() public view virtual override returns (uint256) {
    return 0;
  }

  function getDataFeedId() public pure  override returns (bytes32) {
    return WBTC_ID;
  }


    function getDataServiceId() public pure override returns (string memory) {
    return "redstone-primary-prod";
  }

  function getUniqueSignersThreshold() public pure override returns (uint8) {
    return 2;
  }

  function getAuthorisedSignerIndex(
    address signerAddress
  ) public view virtual override returns (uint8) {
    if (signerAddress == 0x8BB8F32Df04c8b654987DAaeD53D6B6091e3B774) {
      return 0;
    } else if (signerAddress == 0xdEB22f54738d54976C4c0fe5ce6d408E40d88499) {
      return 1;
    } else if (signerAddress == 0x51Ce04Be4b3E32572C4Ec9135221d0691Ba7d202) {
      return 2;
    } else if (signerAddress == 0xDD682daEC5A90dD295d14DA4b0bec9281017b5bE) {
      return 3;
    } else if (signerAddress == 0x9c5AE89C4Af6aA32cE58588DBaF90d18a855B6de) {
      return 4;
    } else {
      revert SignerNotAuthorised(signerAddress);
    }
  }



}
