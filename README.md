<!-- Improved compatibility of back to top link: See: https://github.com/trashpirate/flamelings-artwork/pull/73 -->
<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Website][website-shield]][website-url]

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
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
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

This repository contains the smart contract and deployment/testing suite to create an NFT (Non-Fungible Token) collection consisting of 1000 unique AI-generated images known as "flamelings." These flame creatures come with five different traits of varying rarity: WHITE (790), BLUE (100), YELLOW (80), RED (20), and NOVA (10). The entire process, from renaming files to generating metadata files, is designed to facilitate the upload of the collection to [IPFS](https://ipfs.tech/).

### Smart Contracts Testnet

**Payment Token Contract**  
https://sepolia.etherscan.io/address/0x09601e2bfa5b0101e0ba151541d95646b1eee381

**NFT Contract**

### Smart Contracts Mainnet

**Payment Token Contract**  
https://etherscan.io/address/0x0b61C4f33BCdEF83359ab97673Cb5961c6435F4E

**NFT Contract**




### Built With

[![Forge][Foundry]][Foundry-url]
<!-- [![Node][Node.js]][Node-url] -->
<!-- * [![Next][Next.js]][Next-url]
* [![React][React.js]][React-url]
* [![Vue][Vue.js]][Vue-url]
* [![Angular][Angular.io]][Angular-url]
* [![Svelte][Svelte.dev]][Svelte-url]
* [![Laravel][Laravel.com]][Laravel-url]
* [![Bootstrap][Bootstrap.com]][Bootstrap-url]
* [![JQuery][JQuery.com]][JQuery-url] -->


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

Project Link: [https://github.com/trashpirate/flamelings-artwork](https://github.com/trashpirate/flamelings-artwork)


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/trashpirate/flamelings-artwork.svg?style=for-the-badge
[contributors-url]: https://github.com/trashpirate/flamelings-artwork/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/trashpirate/flamelings-artwork.svg?style=for-the-badge
[forks-url]: https://github.com/trashpirate/flamelings-artwork/network/members
[stars-shield]: https://img.shields.io/github/stars/trashpirate/flamelings-artwork.svg?style=for-the-badge
[stars-url]: https://github.com/trashpirate/flamelings-artwork/stargazers
[issues-shield]: https://img.shields.io/github/issues/trashpirate/flamelings-artwork.svg?style=for-the-badge
[issues-url]: https://github.com/trashpirate/flamelings-artwork/issues
[license-shield]: https://img.shields.io/github/license/trashpirate/flamelings-artwork.svg?style=for-the-badge
[license-url]: https://github.com/trashpirate/flamelings-artwork/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/nadinaoates
[website-shield]: https://img.shields.io/badge/-Website-black.svg?style=for-the-badge&logo=web&colorB=00e0a7
[website-url]: https://nadinaoates.com
[product-screenshot]: images/screenshot.png
[Node.js]: https://img.shields.io/badge/node.js-000000?style=for-the-badge&logo=nodedotjs&logoColor=white
[Node-url]: https://nodejs.org/
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
[Foundry]: https://img.shields.io/badge/Forge-FADA5E?style=for-the-badge&logo=forge&logoColor=000000
[Foundry-url]: https://github.com/foundry-rs
