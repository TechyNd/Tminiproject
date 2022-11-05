//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//this is the interface for our main contract ERC20token. here,
//we see all the function that we would need in the main contract

interface IERC20{

    function totalSupply()external view returns(uint);
    function balanceOf(address account)external view returns(uint);
    function transfer(address recipient, uint amount)external returns(uint);
    function allowance(address owner, address spender)external view returns(uint);
    function approve(address sender, uint amount)external returns(bool);
    function tranasferFrom(address sender, address recipient, uint amount)external returns(bool);

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);

}
