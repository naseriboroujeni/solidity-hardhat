// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract BaseContract {
    string public name;

    event NameChanged(string oldName, string newName);

    constructor(string memory _name) {
        name = _name;
    }

    function setName(string calldata _newName) public returns (string memory) {
        string memory oldName = name;
        name = _newName;
        emit NameChanged(oldName, name);
        return name;
    }
}
