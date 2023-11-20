# DegenToken Smart Contract

## Overview

DegenToken is an ERC-20 token smart contract built on the Ethereum blockchain. It provides basic functionality for minting, burning, and transferring tokens. Additionally, it includes a feature to allow users to purchase instruments using the token.

## Features

- Minting and burning of tokens by the owner.
- Transfer of tokens between addresses.
- Purchase of instruments (cymbals, piano, strings) using tokens, with tokens being burned in the process.

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/DegenToken.git
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Deploy the smart contract to the Ethereum blockchain using tools like Truffle or Remix.

## Smart Contract Functions

### Minting

The owner can mint new tokens by calling the `mint` function.

```solidity
function mint(address to, uint256 amount) public onlyOwner {
    // Implementation details...
}
```

### Burning

Token holders can burn their tokens by calling the `burn` function.

```solidity
function burn(uint256 amount) public {
    // Implementation details...
}
```

### Transferring

Tokens can be transferred between addresses using the `transfer` function.

```solidity
function transfer(address to, uint256 amount) public override returns (bool) {
    // Implementation details...
}
```

### Buying Instruments

Users can purchase instruments (cymbals, piano, strings) using tokens. The tokens used for the purchase are burned.

```solidity
function buyInstrument(string memory instrument) public {
    // Implementation details...
}
```

## Instrument Prices

The prices of instruments are set in the `instrumentPrices` mapping within the constructor.

```solidity
instrumentPrices["cymbals"] = 20;
instrumentPrices["piano"] = 20;
instrumentPrices["strings"] = 20;
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
