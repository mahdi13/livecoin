import "./ERC20Burnable.sol";

contract LIVEABLE is ERC20Burnable {
    uint256 private _executorStaticReward;
    uint256 private _executorPercentileReward;
    uint256 private _lifetime;

    mapping(address => uint256) private _movement;

    function execute(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer from the zero address");
        require(now - _movement[recipient] > _lifetime, "ERC20: execution not allowed at this time");

        uint256 executionAmount = _balances[recipient];
        _burn(recipient, executionAmount);
        _mint(sender, executionAmount.mul(_executorPercentileReward).div(100).add(_executorStaticReward));
        return true;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {
        _movement[from] = now;
    }

}
