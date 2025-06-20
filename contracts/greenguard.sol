// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Project {
    struct EcoAction {
        address user;
        string description;
        string proof; // Could be IPFS hash or external link
        uint256 timestamp;
    }

    EcoAction[] public actions;
    mapping(address => uint256) public userContributionCount;

    event ActionSubmitted(address indexed user, string description, uint256 timestamp);

    // 1. Submit an eco-action
    function submitAction(string calldata _description, string calldata _proof) external {
        EcoAction memory newAction = EcoAction({
            user: msg.sender,
            description: _description,
            proof: _proof,
            timestamp: block.timestamp
        });

        actions.push(newAction);
        userContributionCount[msg.sender]++;
        emit ActionSubmitted(msg.sender, _description, block.timestamp);
    }

    // 2. Get total eco-actions submitted
    function getTotalActions() external view returns (uint256) {
        return actions.length;
    }

    // 3. Get user's contribution count
    function getMyContributionCount() external view returns (uint256) {
        return userContributionCount[msg.sender];
    }
}
