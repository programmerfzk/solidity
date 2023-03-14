// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract HelloWeb3{
    // 地址
    address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    address payable public _address1 = payable(_address); // payable address，可以转账、查余额

    function transfer(address payable addr) public payable{
        addr.transfer(1);
    }
   
    function transferToContract() public payable {
        payable(address(this)).transfer(msg.value);
    }

    function getBalanceOf(address addr) public view returns(uint256){
        return addr.balance;
    }

    receive() external payable {}
}