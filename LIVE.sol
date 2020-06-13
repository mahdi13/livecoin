pragma solidity ^0.6.2;

import "./LIVEABLE.sol";

contract LIVE is LIVEABLE {
    constructor() public {
        _totalSupply = 1000000;
        _name = "LIVECOIN";
        _decimals = 18;
        _symbol = "LIVE";
        _lifetime = 2592000;
        _executorStaticReward = 10;
        _executorPercentileReward = 1;
        _mint(msg.sender, totalSupply);
    }
}
