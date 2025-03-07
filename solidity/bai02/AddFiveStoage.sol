// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

import { SimpleStorage } from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function store(uint256 newNumber) public override {
        number = newNumber + 5;
    }
}