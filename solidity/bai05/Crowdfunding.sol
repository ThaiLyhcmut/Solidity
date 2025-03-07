// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

import {PriceConverter} from "./PriceConverter.sol";

contract Crowdfunding {
    using PriceConverter for uint256;
    error NoAvailabelAmount();
    uint256 private constant WeiMinimum = uint256(5 * 1e18); // 5eth
    address public immutable i_owner = 0x1ddfE2c36478E61cE3acBE4B96e57143E1964FFd;

    receive() external payable { 
        fund();
    }
    fallback() external payable { 
        fund();
    }

    constructor () {
        i_owner = msg.sender;
    }

    modifier onlyOwner () {
        // _ ; onlyOwner chay sau xong toi ham tiep theo
        if (i_owner != msg.sender){
            revert NoAvailabelAmount();
        }
        _ ; // onlyOwner chay truoc xong toi ham tiep theo
    }

    function fund() public payable  {
        uint256 valueInUsd = msg.value.getConversionRate();
        require(valueInUsd >= WeiMinimum, "no availabel amount");
    }
    function withdraw() public onlyOwner {
        
        (bool sent, ) = payable(i_owner).call{value: address(this).balance}("");
        require(sent, "Failed to send Eth");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
}