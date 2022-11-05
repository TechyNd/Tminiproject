//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//importing the file where interface reside
import "./interface4miniprojecterc20.sol";

//here contract erc20token is inheriting ierc20 
contract Erc20token is IERC20{
    uint public override totalSupply;
    mapping(address => uint) public override balanceOf;
    mapping(address => mapping(address => uint)) public override allowance;
    string public name ="tech4dev";
    string public symbol ="t4d";
    uint public decimal = 18; 

    function transfer(address recipient, uint amount) external override returns(uint){
        balanceOf[msg.sender] -= amount; //method 1 balanceof [msg.sender] = balanceof[msg.sender]
        balanceOf[recipient] -= amount; //method 2 balanceof [recipient] = balanceof[recipient]

        emit Transfer(msg.sender, recipient, amount);
        return 0;
    }
    function approve(address spender, uint amount) external override returns(bool){
        //function approve work when there is allowance
        allowance[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);
        return true;
    }

    //this function allows transfer of money from senders account to the recipients account
    function transferFrom(address sender, address recipient, uint amount) external override returns(bool){
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount; 
        balanceOf[recipient] += amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }
//this function allows us to create more token
     function mint (uint amount) public {
            balanceOf[msg.sender] += amount; //this code lets you create required token
            totalSupply += amount;

            emit Transfer(address(0), msg.sender, amount);
        }
        //this function allows to destroy the mint token if no more needed
        function burn(uint amount) public{
            balanceOf[msg.sender] -= amount;

            emit Transfer(msg.sender, address(0), amount);
        }

    }

     

