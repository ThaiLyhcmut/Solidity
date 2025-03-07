// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract SimpleStorage {
    uint256 number;
    struct Person {
        uint256 id;
        string name;
    }
    Person[] public peoples;
    mapping(string => uint256) public nameToId;

    function store(uint256 newNumber) public virtual {
        number = newNumber;
    }
    function addPerson(uint256 newId, string memory newName) public {
        peoples.push(Person(newId, newName));
    }
    function getNumber() public view returns(uint) {
        return number;
    }
}