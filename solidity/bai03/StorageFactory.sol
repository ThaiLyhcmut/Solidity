// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

import { SimpleStorage } from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorages;
    function createSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorages.push(simpleStorage);
    }
    function sfStore(uint256 index,uint256 newNumber) public {
        simpleStorages[index].store(newNumber);
    }
    function getStoredNumber(uint256 index) public view returns(uint256) {
        return simpleStorages[index].getNumber();
    }
}