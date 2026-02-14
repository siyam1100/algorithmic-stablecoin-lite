// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract StableToken is ERC20, Ownable {
    constructor() ERC20("Stablecoin", "STB") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function burnFrom(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }
}
