# Algorithmic Stablecoin Lite

A professional-grade blueprint for a decentralized, non-collateralized stablecoin system. This repository demonstrates the core logic used in seigniorage models to maintain a price peg through supply elasticity.

## Features
- **Dual Token Model**: 
    - **Stable Token (STB)**: The asset pegged to 1.00 unit.
    - **Share Token (SHR)**: The utility/governance token that absorbs volatility.
- **Treasury Logic**: Automatically calculates price deviations and adjusts supply.
- **Expansion/Contraction**: Mints new STB to SHR holders during expansion; allows burning STB for incentives during contraction.
- **Flat Structure**: All logic, interfaces, and deployment scripts are in the root directory.



## Security Note
This is an educational implementation. Algorithmic stablecoins are high-risk financial primitives. Ensure rigorous auditing and economic simulation before any production use.

## License
MIT
