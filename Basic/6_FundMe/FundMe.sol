// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    // mapping for funded amount from payer
    mapping(address => uint256) public addressToAmountFunded;

    // contract funders
    address[] public funders;
    // owner of the contract
    address public owner;

    // owner set to deployer when deployed
    constructor() public {
        owner = msg.sender;
    }

    // 'payable' function that funds an account
    // and keeps track of the payers
    // msg.sender = sender of the value
    // msg.value = value sent from msg.sender
    function fund() public payable {
        // $50 minimum to fund, else xaction is reverted.
        uint256 minimumUsd = 50 * 10 ** 18;
        require(getConversionRate(msg.value) >= minimumUsd, "Amount below $50 USD minimum.");
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    // get ETH -> USD Version on Rinkeby
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );
        return priceFeed.version();
    }

    // get ETH -> USD current price
    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

    // get ETH -> USD conversion rate
    function getConversionRate(uint256 ethAmount)
        public
        view
        returns (uint256)
    {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 100000000000000000;
        return ethAmountInUsd;
    }

    // modifier to require onlyOwner to call function
    modifier onlyOwner {
        require(msg.sender == owner, "Not the contract owner.");
        _;
    }

    // withdraw funds sent
    // only callable by 'owner' or contact deployer
    // taken from 'onlyOwner' modifier
    function withdraw() payable onlyOwner public {
        msg.sender.transfer(address(this).balance);
        
        // for loop to reset all balances to 0
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset the funders array
        funders = new address[](0);
    }
}
