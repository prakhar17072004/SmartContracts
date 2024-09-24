
//SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract MyToken {
    string public  name = "Prakhar";
    string public  symbol = "##$";
    uint8 public  decimals = 18;
    uint public  totalSupply = 1000000 * (10 **uint(decimals));


    mapping (address =>uint)public balanceOf;
    mapping (address=>mapping (address=>uint)) public allowance;


    event Transfer(address indexed from , address indexed to,uint value);
    event Approval(address indexed  owner , address indexed spender,uint value);

    constructor(){
        balanceOf[msg.sender]=totalSupply;


    }

    function transfer(address _to , uint _value) public  returns(bool success){
        require(balanceOf[msg.sender]>= _value, "Insufficient balance");
        balanceOf[msg.sender]-=_value;
        balanceOf[_to]+=_value;
        emit Transfer(msg.sender , _to , _value);
        return  true;
    }
  function approve(address _spender , uint _value) public  returns (bool success){
    allowance[msg.sender][_spender] = _value;
    emit  Approval(msg.sender, _spender, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint _value)public  returns  (bool success){
    require(balanceOf[_from]>=_value,"Insufficient balance");
    require(allowance[_from][msg.sender]>= _value , "Allowance exceeded");
    balanceOf[_from]-= _value;
    balanceOf[_to]+=_value;
    allowance[_from][msg.sender]-=_value;
    emit  Transfer(_from, _to, _value);
    return true;
  }

}