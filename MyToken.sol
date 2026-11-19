// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    /**
     * @dev Constructor that gives msg.sender all of initial supply.
     * @param initialSupply Total number of tokens to mint (without decimal zeros).
     */
    constructor(uint256 initialSupply) 
        ERC20("Active", "ACT") 
        Ownable(msg.sender) 
    {
        // Automatically adds 18 decimals (10^18) to the supply
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    // Optional function allowing the contract owner to mint additional tokens if needed
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
