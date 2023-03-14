// SPDX-License-Identifier: MIT
pragma solidity ~0.8.1;

contract ConstantTest{
    /*
        constant 修饰的称为常量，声明时需要指定值，不可在其他任何地方修改。

        immutable 不可变量，可以在声明时赋值或者在构造函数中赋值，一旦赋值，不可进行修改（不允许两处赋值），其他地方不可赋值。
    */

    // 常量必须在声明时指定值 => 常量存放在代码区，编译时就知道值
    // TypeError: Uninitialized "constant" variable.
    // int constant CONSTANT_INT;
    int constant CONSTANT_INT = 233;

    string constant CONSTANT_STR = "safasdfasf";

    // string和bytes可以声明为constant，但不能为immutable
    // TypeError: Immutable variables cannot have a non-value type
    // string public immutable IMMUTABLE_STR;
    uint256 public immutable IMMUTABLE_NUM = 9999999999;

    constructor(){
        // TypeError: Immutable state variable already initialized.
        // IMMUTABLE_NUM = 2222222;
    }
}