// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandRegistrySimple {

    // Each property has a unique ID, owner, and details
    struct Land {
        uint256 id;
        string landLocation;
        address owner;
    }

    uint256 public landCount = 0;
    mapping(uint256 => Land) public lands;

    // Events to show actions on blockchain
    event LandRegistered(uint256 id, string location, address owner);
    event LandTransferred(uint256 id, address from, address to);

    // Register new land
    function registerLand(string memory _location) public {
        landCount++;
        lands[landCount] = Land(landCount, _location, msg.sender);
        emit LandRegistered(landCount, _location, msg.sender);
    }

    // Transfer land ownership to someone else
    function transferLand(uint256 _landId, address _newOwner) public {
        require(lands[_landId].owner == msg.sender, "Not the owner!");
        lands[_landId].owner = _newOwner;
        emit LandTransferred(_landId, msg.sender, _newOwner);
    }

    // View land details
    function getLand(uint256 _landId) public view returns (uint256, string memory, address) {
        Land memory land = lands[_landId];
        return (land.id, land.landLocation, land.owner);
    }
}
