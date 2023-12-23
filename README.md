# FLAMELINGS-SMART-CONTRACTS

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?style=for-the-badge)
![Forge](https://img.shields.io/badge/Forge-v0.2.0-blue?style=for-the-badge)
[![License: MIT](https://img.shields.io/github/license/trashpirate/hold-earn.svg?style=for-the-badge)](https://github.com/trashpirate/hold-earn/blob/main/LICENSE)

[![Website: nadinaoates.com](https://img.shields.io/badge/Portfolio-00e0a7?style=for-the-badge&logo=Website)](https://nadinaoates.com)
[![LinkedIn: nadinaoates](https://img.shields.io/badge/LinkedIn-0a66c2?style=for-the-badge&logo=LinkedIn&logoColor=f5f5f5)](https://linkedin.com/in/nadinaoates)
[![Twitter: N0\_crypto](https://img.shields.io/badge/@N0\_crypto-black?style=for-the-badge&logo=X)](https://twitter.com/N0\_crypto)

<!-- ![Node](https://img.shields.io/badge/node-v20.10.0-blue.svg?style=for-the-badge)
![NPM](https://img.shields.io/badge/npm-v10.2.3-blue?style=for-the-badge)
![Nextjs](https://img.shields.io/badge/next-v13.5.4-blue?style=for-the-badge)
![Tailwindcss](https://img.shields.io/badge/TailwindCSS-v3.0-blue?style=for-the-badge)
![Wagmi](https://img.shields.io/badge/Wagmi-v1.4.3-blue?style=for-the-badge) -->

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#usage">Usage</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <!-- <li><a href="#acknowledgments">Acknowledgments</a></li> -->
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

This repository contains the smart contract and deployment/testing suite to create an NFT (Non-Fungible Token) collection consisting of 1000 unique AI-generated images known as "flamelings." These flame creatures come with five different traits of varying rarity: WHITE (790), BLUE (100), YELLOW (80), RED (20), and NOVA (10).

### Smart Contracts Testnet

**Payment Token Contract**  
https://sepolia.etherscan.io/address/0x09601e2bfa5b0101e0ba151541d95646b1eee381

**NFT Contract**
https://sepolia.etherscan.io/token/0x329c08c1e8758a5376c16906192f6ac7ff9f80a3

### Smart Contracts Mainnet

**Payment Token Contract**  
https://etherscan.io/address/0x0b61C4f33BCdEF83359ab97673Cb5961c6435F4E

**NFT Contract**
https://etherscan.io/address/0x49902747796C2ABcc5ea640648551DDbc2c50ba2


<!-- GETTING STARTED -->
## Getting Started

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/your-username/flameling-smart-contracts.git
   ```
2. Navigate to the project directory
   ```sh
   cd flameling-smart-contracts
   ```
3. Install Forge submodules
   ```sh
   forge install
   ```

### Usage

#### Compiling
```sh
forge compile
```

#### Testing locally

1. Start local test environment
    ```sh
    make anvil-mainnet
    ```
2. Run local tests
    ```sh
    make test-local-all
    ```

#### Deploy to sepolia

1. Create test wallet using keystore. Enter private key of test wallet when prompted.
    ```sh
    cast wallet import Testing --interactive
    ```
    
2. Deploy to sepolia
    ```sh
    make deploy-testnet contract=Flamelings nework=sepolia
    ```

#### Deploy to mainnet
1. Create deployer wallet using keystore. Enter private key of deployer wallet when prompted.
    ```sh
    cast wallet import <KeystoreName> --interactive
    ```
    
2. Deploy to mainnet
    ```sh
    make deploy-mainnet contract=Flamelings nework=mainnet account=<KeystoreName> sender=<deployer address>
    ```

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

Nadina Oates - [@N0_crypto](https://twitter.com/N0_crypto)

Main Repository: [https://github.com/trashpirate/flamelings](https://github.com/trashpirate/flamelings)

Project Link: [https://flame.buyholdearn.com/](https://flame.buyholdearn.com/)


<!-- ACKNOWLEDGMENTS -->
<!-- ## Acknowledgments -->

