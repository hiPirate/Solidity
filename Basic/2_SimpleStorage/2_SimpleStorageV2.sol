// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorageV2 {
    uint256 public favNumber;

    function store(uint256 fFavNumber) public {
        favNumber = fFavNumber;
    }

    function retrieve() public view returns(uint256) {
        return favNumber;
    }
}