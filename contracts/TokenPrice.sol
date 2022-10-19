// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract TokenPrice {
    AggregatorV3Interface private priceFeedAddress;

    // constructor(address _priceFeedAddress) {
    //     priceFeedAddress = AggregatorV3Interface(_priceFeedAddress);
    // }

    function getPrice(address _priceFeedAddress) public returns (uint256) {
        //Goerli Eth/USDAddress 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        priceFeedAddress = AggregatorV3Interface(_priceFeedAddress);
        (, int256 price, , , ) = priceFeedAddress.latestRoundData();
        return uint256(price * 1e10);
    }
}
