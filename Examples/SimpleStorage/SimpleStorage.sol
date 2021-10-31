//SimpleStorage.sol
//EatTheBlocks: Solidity / Ethereum Smart Contract Tutorial
pragma solidity >=0.5.0 <0.9.0;

contract SimpleStorage {
    string public data;

    function set(string memory fData) public {
        data = fData;
    }

    function get() public view returns(string memory) {
        return data;
    }
}