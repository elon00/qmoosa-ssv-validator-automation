// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

interface ISSVNetwork {
    function registerValidator(bytes calldata publicKey, uint64[] memory operatorIds, bytes[] memory sharesData, uint256 amount) external;
}

contract SSVClusterManager is Ownable {
    event ClusterRegistered(address indexed owner, uint64[] operatorIds);

    constructor() Ownable(msg.sender) {}

    function registerCluster(uint64[] memory operatorIds) external onlyOwner {
        require(operatorIds.length >= 4, "SSV requires minimum 4 operators for fault-tolerance");
        emit ClusterRegistered(msg.sender, operatorIds);
    }
}
