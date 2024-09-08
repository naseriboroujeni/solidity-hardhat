// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Counter} from "./Counter.sol";

contract Increamentor {
    Counter public myCounter;

    constructor(address CounterAddress) {
        myCounter = Counter(CounterAddress);
    }

    function increamentCounter() public returns (uint8) {
        uint8 count = myCounter.increaseCount();
        return count;
    }
}
