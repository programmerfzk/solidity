// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract ParamTest{
    /*
        变量初始值：
            1. 所有值类型，初始值为该类型的默认值
                bool => false
                string => ""
                int => 0
                uint => 0
                enum => 枚举第一个元素
                address => 20 位零地址
                function 
                    空执行体

            2. 引用类型
                相关元素为对应默认值
                映射mapping: 所有元素都为其默认值的mapping
                结构体struct: 所有成员设为其默认值的结构体
                数组array
                    动态数组: []
                    静态数组（定长）: 所有成员设为其默认值的静态数组

            3. delete 操作
                delete a会让变量a的值变为初始值
    */
     // delete操作符
    bool public _bool2 = true; 
    function d() external {
        delete _bool2; // delete 会让_bool2变为默认值，false
    }
}