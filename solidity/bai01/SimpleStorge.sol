// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <=0.9.0;

contract SimpleStorage {
    uint256 public number;
    uint256[] public arrOfNumber;
    uint256[5] public fixedArrayOfNumber;
    struct Person {
        string name;
        uint256 number;
    }
    Person[] public dynamicArrayOfPerson;
    mapping(string name => uint256 number) public nameToNumber;
    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }
    function pushToArrayOfNumber(uint256 newNumber) public {
        arrOfNumber.push(newNumber);
    }
    function pushToFixedArrayOfNumber(uint256 index, uint256 newNumber) public {
        fixedArrayOfNumber[index] = newNumber;
    }
    function pushToDynamicArrayOfPerson(string memory name, uint256 newNumber) public {
        dynamicArrayOfPerson.push(Person({name: name, number: newNumber}));
    }
    function addNumberForName(string memory name, uint newNumber) public {
        nameToNumber[name] = newNumber;
    }
}