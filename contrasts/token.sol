pragma solidity ^0.8.0;

contract Token{

string public name='Token';
string public symbol='USDT';
uint256 public totalSupply=1000000000000000000;
uint8 public decimal=18;

mapping(address=>uint256) public balances;
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
function TransferFrom(address _from,address _to,uint256 value) public {
    require(balances[_from]>=value);
    balances[_from]-=value;
    balances[_to]+=value;
    emit TransferEVENT(_from,_to,value);
}
function balanceOf(address _owner) public view returns(uint256){
    return balances[_owner];
}
}