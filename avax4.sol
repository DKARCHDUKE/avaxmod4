// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(string => uint256) public instrumentPrices;
    mapping(address => mapping(string => uint256)) public userInstruments;

    event InstrumentPurchased(address indexed buyer, string instrument, uint256 amount);

    constructor() ERC20("Degen", "DGN") {
        // Set instrument prices
        instrumentPrices["cymbals"] = 20;
        instrumentPrices["piano"] = 20;
        instrumentPrices["strings"] = 20;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    function buyInstrument(string memory instrument) public {
        uint256 price = instrumentPrices[instrument];
        require(price > 0, "Instrument not available for purchase");
        require(balanceOf(msg.sender) >= price, "Insufficient balance");

        _burn(msg.sender, price); // Burn the tokens
        userInstruments[msg.sender][instrument] += 1;

        emit InstrumentPurchased(msg.sender, instrument, price);
    }
}
