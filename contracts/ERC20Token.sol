// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "./SafeMath.sol";

contract ERC20 {
    
    using SafeMath for uint256;

    mapping (address => uint256) internal balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    uint256 internal totalSupply_;

    event Transfer(address indexed _sender, address indexed _to, uint256 _value);

    function totalSupply() external view returns (uint256) {
        return totalSupply_;
    }

    function transfer(address _to, uint256 _value) external returns (bool) {
        require(_value <= balances[msg.sender]);
        require(_to != address(0));

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
}
