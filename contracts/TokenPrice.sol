// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceFeed {
    AggregatorV3Interface private priceFeedAddress;

    constructor(address _priceFeedAddress) {
        priceFeedAddress = AggregatorV3Interface(_priceFeedAddress);
    }

    function getEthPrice() public view returns (uint256) {
        //Goerli Eth/USDAddress 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        //AggregatorV3Interface ethPrice = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (, int256 price, , , ) = priceFeedAddress.latestRoundData();
        return uint256(price * 1e10);
    }
}
