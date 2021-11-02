//HelloWorld.sol
//EatTheBlocks: Solidity / Ethereum Smart Contract Tutorial
pragma solidity >=0.5.0 <0.9.0;

contract HelloWorld {
    function hello() public pure returns(string memory) {
        return "Hello World";
    }
}
