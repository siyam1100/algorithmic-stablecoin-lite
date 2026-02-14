// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {StableToken} from "./StableToken.sol";
import {IERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

/**
 * @title Treasury
 * @dev Simplistic Treasury to manage supply based on an external price feed (oracle).
 */
contract Treasury {
    StableToken public stable;
    IERC20 public shareToken;
    address public owner;
    
    uint256 public constant TARGET_PRICE = 1e18; // 1.00 USD (represented in 18 decimals)

    constructor(address _stable, address _share) {
        stable = StableToken(_stable);
        shareToken = IERC20(_share);
        owner = msg.sender;
    }

    // In a real scenario, this price would come from a Chainlink Oracle
    function adjustSupply(uint256 currentPrice) external {
        require(msg.sender == owner, "Only owner");

        if (currentPrice > TARGET_PRICE) {
            // Expansion: Price is too high, mint more stablecoins
            uint256 percentage = ((currentPrice - TARGET_PRICE) * 100) / TARGET_PRICE;
            uint256 supplyToAdd = (stable.totalSupply() * percentage) / 100;
            
            // Distribute to Treasury/Share holders (simplified)
            stable.mint(address(this), supplyToAdd);
        } 
        // Contraction logic would involve offering Bonds for burned Stablecoins
    }

    function withdrawRewards(uint256 amount) external {
        require(msg.sender == owner, "Only owner");
        stable.transfer(owner, amount);
    }
}
