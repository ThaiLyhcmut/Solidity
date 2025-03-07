// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getETHData() public view returns (int) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int answer,,,) = dataFeed.latestRoundData();
        require(answer > 0, "No Price");
        return answer*1e10;
    }   
    function getConversionRate(uint256 ethAmount) internal view returns (uint256){
        uint256 ethPriceUsd = uint256(getETHData());
        uint256 valueInUsd = ethAmount * ethPriceUsd / 1e18;
        return valueInUsd;
    }
}