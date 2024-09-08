// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {BaseContract} from "./BaseContract.sol";

contract Counter is BaseContract {
    uint8 private count;

    enum CountChage {
        INCREASED,
        DECREASED
    }

    event CountChanged(uint8 oldCount, uint8 newCount, CountChage change);

    constructor(uint8 _initialCount, string memory _name) BaseContract(_name) {
        count = _initialCount;
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

    function sumOfArray(uint8[] calldata array) public pure returns (uint8) {
        uint8 sum = 0;
        for (uint8 i = 0; i < array.length; i++) {
            sum += array[i];
        }
        return sum;
    }
}
