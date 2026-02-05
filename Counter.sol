// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 private count;

    // Events
    event Incremented(uint256 newValue);
    event Decremented(uint256 newValue);
    event Reset(uint256 newValue);

    // Get current count
    function getCount() public view returns (uint256) {
        return count;
    }

    // Increase counter by 1
    function increment() public {
        count += 1;
        emit Incremented(count);
    }

    // Decrease counter by 1 (prevent negative values)
    function decrement() public {
        require(count > 0, "Counter cannot be negative");
        count -= 1;
        emit Decremented(count);
    }

    // Reset counter to zero
    function reset() public {
        count = 0;
        emit Reset(count);
    }
}
