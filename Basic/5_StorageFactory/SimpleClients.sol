// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract SimpleClients {
    uint256 public id;
    bool active;

    // Struct
    struct Clients {
        uint256 id;
        string name;
    }

    // Dynamic Array
    Clients[] public client;
    mapping(string => uint256) public nameToId;

    // Store
    function store(uint256 fId) public {
        id = fId;
    }

    // Retrieve
    function retrieve() public view returns(uint256) {
        return id;
    }

    // Add client to Dynamic Array 'Clients'
    function addClient(string memory fName, uint256 fId) public {
        client.push(Clients(fId, fName));
        nameToId[fName] = fId;
    }
}