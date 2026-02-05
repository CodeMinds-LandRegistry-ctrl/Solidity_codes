// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SingleNumberStorage {
    uint256 private number;

    // Event emitted when the number is updated
    event NumberUpdated(uint256 oldNumber, uint256 newNumber);

    // Set a new number
    function setNumber(uint256 _newNumber) public {
        uint256 oldNumber = number;
        number = _newNumber;
        emit NumberUpdated(oldNumber, _newNumber);
    }

    // Get the stored number
    function getNumber() public view returns (uint256) {
        return number;
    }
}
