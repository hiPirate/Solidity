//AdvancedStorage.sol
//EatTheBlocks: Solidity / Ethereum Smart Contract Tutorial
pragma solidity >=0.5.0 <0.9.0;

contract AdvancedStorage {
    uint[] public ids;

    function add(uint id) public {
        ids.push(id);
    }

    function get(uint position) public view returns(uint) {
        return ids[position];
    }

    function getAll() public view returns(uint[] memory) {
        return ids;
    }

    function length() public view returns(uint) {
        return ids.length;
    }
}