// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor(uint256 initialSupply,string memory tokenName,string memory token_symbol) ERC20(tokenName, token_symbol) {
        _mint(msg.sender, initialSupply*(10**16));
    }
}
