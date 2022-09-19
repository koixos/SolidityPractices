// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ToDoList {
    struct ToDo {
        string task;   
        bool isCompleted;
    }

    ToDo[] private tasks;

    function create(string calldata _task) external {
        // Function to create a new to-do
        tasks.push(ToDo ({
            task: _task,
            isCompleted: false  // Default initialization
        }));
    }

    function updateTask(uint _index, string calldata _task) external {
        // Function to update the name of a spesific to-do
        tasks[_index].task = _task;
    }

    function toggleCompleted(uint _index) external {
        // Function to update if a to-do is completed or not
        tasks[_index].isCompleted = !tasks[_index].isCompleted;
    }

    function getTask(uint _index) external view returns(string memory, bool) {
        // Function to get the data of a spesific to-do
        return ( tasks[_index].task, tasks[_index].isCompleted );
    }
}