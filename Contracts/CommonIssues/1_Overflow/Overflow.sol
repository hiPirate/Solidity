// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Overflow {

    function overflow() public view returns(uint8) {
        // uint8 = capped at 255
        // uint8 255 + 100 = 99
        uint8 big = 255 + uint8(100); // returns '99';

        return big;
    }
}