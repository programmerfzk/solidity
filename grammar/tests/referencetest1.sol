// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract TestA{
    /*
        storage：合约里的状态变量默认都是storage，存储在链上。

        memory：函数里的参数和临时变量一般用memory，存储在内存中，不上链。

        calldata：和memory类似，存储在内存中，不上链。与memory的不同点在于calldata变量不能修改（immutable），一般用于函数的参数
    */
    function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata){
        // Calldata arrays are read-only.
        // _x[0] = 333;
        return _x;
    }

    /*
        在不同存储类型相互赋值时候，有时会产生独立的副本（修改新变量不会影响原变量），有时会产生引用（修改新变量会影响原变量）。规则如下：
        1. storage（合约的状态变量）赋值给本地storage（函数里的）时候，会创建引用，改变新变量会影响原变量
        2. storage赋值给memory，会创建独立的复本，修改其中一个不会影响另一个；反之亦然
        3. memory赋值给memory，会创建引用，改变新变量会影响原变量
        4. 其他情况，变量赋值给storage，会创建独立的复本，修改其中一个不会影响另一个
    */
    uint[] public x = [1,2,3]; // 状态变量：数组 x

    function fStorage() public{
        //声明一个storage的变量 xStorage，指向x。修改xStorage也会影响x
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }

    function fMemory() public view{
        //声明一个Memory的变量xMemory，复制x。修改xMemory不会影响x
        uint[] memory xMemory = x;
        xMemory[0] = 100;
        xMemory[1] = 200;
        uint[] memory xMemory2 = x;
        xMemory2[0] = 300;
    }

    // Data location must be "memory" or "calldata" for return parameter in function, but none was given
    // function fMemoryToInternalStorage() public returns(uint[]){
    function fMemoryToInternalStorage() public returns(uint[] memory){
        // uint[] storage s = [2,3,4];
        uint[] memory xMemory;
        xMemory[0] = 1;
        xMemory[1] = 100;
        xMemory[2] = 1000;
        // Type uint256[] memory is not implicitly convertible to expected type uint256[] storage pointer
        // storage必须是静态分配存储空间的。局部变量虽然是一个storage的，但它仅仅是一个storage类型的指针
        // s = xMemory;
        x = xMemory;
        return x;
    }

    function fMemoryToInternalStorage(uint[] memory mem) public pure returns(uint[] memory){
        return mem;
    }
}