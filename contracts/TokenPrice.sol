// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract TokenPrice {
    AggregatorV3Interface private tokenAddress;

    constructor(address _tokenAddress) {
        tokenAddress = AggregatorV3Interface(_tokenAddress);
    }

    function getEthPrice() public view returns (uint256) {
        //Goerli EthAddress 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        //AggregatorV3Interface ethPrice = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (, int256 price, , , ) = tokenAddress.latestRoundData();
        return uint256(price * 1e10);
    }
}
