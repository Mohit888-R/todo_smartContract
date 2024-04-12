// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract TodoList {

    // defined a type of task
    struct Task{
        string content;
        bool completed;
    }

// define array to store all tasks
    Task[] public  tasks;

    // event to emit when new tasks created
    event newTask(string content, uint256 index);

    // event to emit when tasks mark as completed
    event TaskCompleted(uint256 index, bool completed);

    event TaskUpdate(uint256 index, string content);

    function tasksAdded(string memory _content) public  {
        tasks.push(Task(_content, false));   // validate with struct type to content 
        uint256 index  = tasks.length - 1 ;

    emit newTask(_content, index);
    }


    function getTasksCount()public view returns(uint256){
        return  tasks.length;
    }

    function completedTasks(uint256 _index) public {
        require(_index < tasks.length, "Invalid tasks");
        tasks[_index].completed = true;
        emit TaskCompleted(_index, true);
    }

    function updateTask(string memory _newContent, uint256 _index) public {
        tasks[_index].content = _newContent;
        emit TaskUpdate(_index, _newContent);    
    }

    function getTasks() public view returns (Task[] memory){
         Task[] memory allTasks = new Task[](tasks.length);

            for(uint256 i =0 ;i<tasks.length;i++){
                allTasks[i] = tasks[i];
            }

             return allTasks;
    }
}