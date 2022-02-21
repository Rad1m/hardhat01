pragma solidity ^0.8.0:

contract Token {
    string public name = "DeBe token";
    string public symbol = "DEBE"
    uint256  public totalSupply = 1000000;
    address public owner;
    mapping(address=>uint256 ) balances;

    constructor(){
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer (address to, uint256 amount) external onlyOwner {
        require(balances[msg.sender] >= amount, 'Not enough token balance');
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns(uint256 ) {
        return balances[account]
    }
}