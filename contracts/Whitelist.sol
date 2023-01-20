// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of addresses that can be whitelisted.
    uint8 public maxWhitelistedAddresses;

    // To keep the track of the number of addresses whitelisted till now.
    uint8 public numberAddressesWhitelisted;

    // Addresses actually whitelisted.
    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        // msg.sender is the address of the user who called this function
        require(
            !whitelistedAddresses[msg.sender],
            "Sender already in the whitelist"
        );
        require(
            numberAddressesWhitelisted < maxWhitelistedAddresses,
            "Max limit reached"
        );
        whitelistedAddresses[msg.sender] = true;
        numberAddressesWhitelisted += 1;
    }
}
