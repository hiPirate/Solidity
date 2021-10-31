// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Contract to inherit from.
contract MyBaseContract {
  uint innerVal = 100;
  function innerAdd10(uint val) public pure returns(uint) {
    return val + 10;
  }
}

// Contract that inherits
// MyContract "Inherits From" MyBaseContract
contract MyContract is MyBaseContract {
  function outerAdd10(uint val) public pure returns(uint) {
    return MyBaseContract.innerAdd10(val);
  }

  function getInnerVal() public view returns(uint) {
    return MyBaseContract.innerVal;
  }
}
