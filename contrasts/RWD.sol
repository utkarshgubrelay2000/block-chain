pragma solidity ^0.8.0;
import './token.sol';
import './Tether.sol';
contract RWD{

string public name='RWD';
address public owner;
Tether public tether;
Token public token;
constructor(Token _token,Tether _tether)  {
    tether=_tether;
    token=_token;
}
}