// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ToDo {
  struct Task {
    uint id;
    uint date;
    string content;
    string author;
    bool done;
  }

  uint lastTaskId;
  uint[] taskIds;
  mapping(uint => Task) tasks;

  event TaskCreated(uint, uint, string, string, bool);

  function mToDo() public {
    lastTaskId = 1;
  }

  function createTask(string memory fContent, string memory fAuthor) public {
    lastTaskId++;
    tasks[lastTaskId] = Task(lastTaskId, block.timestamp, fContent, fAuthor, false);
    taskIds.push(lastTaskId);
    emit TaskCreated(lastTaskId, block.timestamp, fContent, fAuthor, false);
  }

  function getTaskIds() public view returns(uint[] memory) {
    return taskIds;
  }

  function getTask(uint id) taskExists(id) public view
  returns(
    uint,
    uint,
    string memory,
    string memory,
    bool
  ) {
    if(tasks[id].id == 0) {
      revert();
    }
    return(
      id,
      tasks[id].date,
      tasks[id].content,
      tasks[id].author,
      tasks[id].done
    );
  }

  modifier taskExists(uint id) {
    if(tasks[id].id == 0) {
      revert();
    }
    _;
  }
}
