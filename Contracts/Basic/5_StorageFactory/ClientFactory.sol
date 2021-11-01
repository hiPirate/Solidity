// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./SimpleClients.sol";

contract ClientsFactory is SimpleClients {

    SimpleClients[] public simpleClientsArray;

    function createSimpleClientsContract() public {
        SimpleClients simpleClients = new SimpleClients();
        simpleClientsArray.push(simpleClients);
    }

    function cfStore(uint256 fSimpleClientIndex, uint256 fSimpleClientId) public {
        SimpleClients(address(simpleClientsArray[fSimpleClientIndex])).store(fSimpleClientId);
    }

    function cfGet(uint256 fSimpleClientIndex) public view returns(uint256) {
        return SimpleClients(address(simpleClientsArray[fSimpleClientIndex])).retrieve();
    }
}