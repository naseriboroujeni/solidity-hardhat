// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Counter {
    uint8 private count;
    string public name;

    enum CountChage {
        INCREASED,
        DECREASED
    }

    event CountChanged(uint8 oldCount, uint8 newCount, CountChage change);

    constructor(uint8 _initialCount, string memory _name) {
        count = _initialCount;
        name = _name;
    }

    function increaseCount() public returns (uint8) {
        uint8 oldCount = count;
        count++;
        emit CountChanged(oldCount, count, CountChage.INCREASED);
        return count;
    }

    function decreaseCount() public returns (uint8) {
        uint8 oldCount = count;
        count--;
        emit CountChanged(oldCount, count, CountChage.DECREASED);
        return count;
    }

    function getCount() public view returns (uint8) {
        return count;
    }

    function setName(string calldata _newName) public returns (string memory) {
        name = _newName;
        return name;
    }

    function sumOfArray(uint8[] calldata array) public pure returns (uint8) {
        uint8 sum = 0;
        for (uint8 i = 0; i < array.length; i++) {
            sum += array[i];
        }
        return sum;
    }
}
