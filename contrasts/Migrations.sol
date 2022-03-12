pragma solidity ^0.8.0;

contract Migrations{
address public owner;
uint public lastTrasaction;

constructor() {
    owner=msg.sender;
}
modifier restricted(){
    if(owner==msg.sender)_;
}
function setCompleted(uint completed)public restricted{
    lastTrasaction=completed;
}
function upgrade(address newaddress) public{
    Migrations upgraded=Migrations(newaddress);
    upgraded.setCompleted(lastTrasaction);
}

}