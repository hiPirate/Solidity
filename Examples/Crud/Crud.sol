//Crud.sol
//EatTheBlocks: Solidity / Ethereum Smart Contract Tutorial
pragma solidity >=0.5.0 <0.9.0;

contract Crud {
    struct User {
        uint id;
        string name;
    }
    User[] public users;
    uint public nextId = 1;

    // Create user
    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    }

    // Read user
    function read(uint id) public view returns(uint, string memory) {
        uint i = find(id);
        return(users[i].id, users[i].name);
    }

    // Update user
    function update(uint id, string memory name) public {
        uint i = find(id);
        users[i].name = name;
    }

    // Destroy user
    function destroy(uint id) public {
        uint i = find(id);
        delete users[i];
    }

    // Find user
    function find(uint id) internal view returns(uint) {
        for(uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
                return i;
            }
        }
        // If user does not exist, revert and print:
        revert("User does not exist.");
    }
}