pragma solidity ^0.8.0;

contract Token{
    address public owner;
    uint public totalSupply=1000000000000000000;
    string public symbol="TETH";
    string public name="Tether";

    mapping(address=>uint) public balances;
    mapping(address =>mapping(address=>uint)) public allowence;

error ownerError(string messgae);
event Transfer(address indexed from,address indexed to,uint value);

constructor(){
    owner=msg.sender;
    balances[msg.sender]=totalSupply;
}
    function TransferMoney(address _to,uint _value) public{
        require(balances[msg.sender]>=_value);
        balances[msg.sender]-=_value;
        balances[_to]+=_value;
        emit Transfer(msg.sender,_to,_value);
        
       
    }
    function TransferFrom(address _from,address _to,uint _value)public{
        require(allowence[msg.sender][_from]>_value);
require(balances[_from]>_value);

        balances[_from]-=_value;
        allowence[msg.sender][_from]-=_value;
        balances[_to]+=_value;
        emit Transfer(_from,_to,_value);

    }
    function giveAllowence(address _to,uint _value)public {
        if(msg.sender==owner){
        allowence[owner][_to]=_value;
        }
    }
   
}
