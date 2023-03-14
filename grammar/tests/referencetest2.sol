// SPDX-License-Identifier: MIT
pragma solidity ~0.8.3;
contract TestA {
    struct Student{
        uint id;
        uint score;
    }

    Student a = Student({id: 11,score: 2});

    function initStu1() external{
        Student storage _student = a;
        _student.id = 22;
        _student.score = 2;
    }
}