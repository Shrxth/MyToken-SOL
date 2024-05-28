// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    
    // 1. Public variables to store token details
    string public name;
    string public symbol;
    uint256 public totalSupply;
    
    // 2. Mapping of addresses to balances
    mapping(address => uint256) public balances;
    
    // Constructor to initialize token details
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply; // Assign initial supply to contract deployer
    }
    
    // 3. Mint function
    function mint(address _to, uint256 _value) public {
        totalSupply += _value;
        balances[_to] += _value;
    }
    
    // 4. Burn function
    function burn(address _from, uint256 _value) public {
        require(balances[_from] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_from] -= _value;
    }
}
