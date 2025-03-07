// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract Crowdfunding {
    error NoAvailableAmout();
    uint256 public constant MINIMUM_USD = 0; // 5USD in wei
    address public immutable i_owner = 0x1ddfE2c36478E61cE3acBE4B96e57143E1964FFd;
    AggregatorV3Interface internal dataFeed;
    receive() external payable { 
        fund();
    }
    fallback() external payable { 
        fund();
    }
    constructor(){
        i_owner = msg.sender;
        dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    modifier onlyOwner() {
        if(i_owner != msg.sender) {
            revert NoAvailableAmout();
        }
        _;
    }

    function fund() public payable { // keyword payable thi msg.value moi doc duoc
        // uint ETHPrice = uint256(getLastestAnswer());
        uint valueInUsd = msg.value;
        require(valueInUsd >= MINIMUM_USD, "HCMUT No Money"); // cho tien dev
    }
    function withdraw() public onlyOwner {
        (bool sent, ) = payable(i_owner).call{value: address(this).balance}(""); // nhan tien vao vi cua owner
        require(sent, "Failed to send Ether");
    }

    function getLastestAnswer() public view returns (int256) {
        // prettier-ignore
        (
            /* uint80 roundID */,
            int256 answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return answer * 1e10;
    }



    function getBalance() public view returns(uint256){
        return address(this).balance; // so tien duoc nguoi khac cho
    }
    function getThisContract() public view returns (address) {
        return address(this); // dia chi cua may chu giu tien
    }
}