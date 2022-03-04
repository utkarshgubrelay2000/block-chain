pragma solidity ^0.8.0;

contract Tether{

string public name='Tether';
string public symbol='USDT';
uint256 public totalSupply=1000000000000000000;
uint8 public decimal=18;

mapping(address=>uint256) public balances;
// allowances
mapping(address=>mapping(address=>uint256)) public allowances;
event TransferEVENT(address indexed from, address indexed to, uint256 value);
constructor() {
    balances[msg.sender]=totalSupply;
}
function Transfer(address _to,uint256 value) public {
    require(balances[msg.sender]>=value);
    balances[msg.sender]-=value;
    balances[_to]+=value;
    emit TransferEVENT(msg.sender,_to,value);
}
function allowance(address _spender,uint256 _value) public{
allowances[msg.sender][_spender]=_value;
}
function getAllowance(address _spender) public view returns(uint256){
return allowances[_spender][msg.sender];
}
function TransferFrom(address _from,address _to,uint256 value) public {
    require(balances[_from]>=value);
    require(allowances[_from][msg.sender]>=value);

    balances[_from]-=value;
    allowances[_from][msg.sender]-=value;
    balances[_to]+=value;
    emit TransferEVENT(_from,_to,value);
}
function balanceOf(address _owner) public view returns(uint256){
    return balances[_owner];
}
}