// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Token{
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowances;
    uint public totalSupply = 1000 * 10 ** 18;
    string public name = "CompSci Token";
    string public symbol = "CSC";
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    constructor(){
        balances[msg.sender] = totalSupply;
    }
    function balanceOf(address owner) public view  returns(uint){
        return balances[owner];
    }
    function transfer(address to, uint value) public returns(bool){
        require(balanceOf(msg.sender) >= value, 'balance too low');
        balances[to] <= value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    function transferfrom(address from, address to, uint value) public returns(bool){
        require(balanceOf(from) >= value, 'balance is low');
        require(allowances[from][msg.sender] >= value , 'allowances is low');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }
    function approve(address spender, uint value) public returns(bool){
        allowances[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}
