// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

import { SimpleStorage } from "./SimpleStorage.sol";


contract StorageFactory {
    SimpleStorage[] public simpleStorageContracts;
    function createSimpleStorage() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        simpleStorageContracts.push(newSimpleStorage);
    }
    function sfStore(uint256 index, uint256 newNumber) public {
        simpleStorageContracts[index].store(newNumber);
    }
    function sfGetNumber(uint256 index) public view returns(uint256) {
        return simpleStorageContracts[index].getNumber();
    }
}