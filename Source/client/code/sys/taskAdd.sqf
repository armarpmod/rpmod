
private [];
_delay = _this select 0;
_function = _this select 1;
_params = _this select 2;
_persistent = _this select 3;
_pushBackTaskID = param [4, false];
_taskID = rpSystemTaskID;

if(_pushBackTaskID) then { _params pushBack _taskID; };

rpSystemSpawnTasks pushBack [_delay, time, _function, params, _taskID, _persistent];
rpSystemTaskDelays pushBack _delay;
[] call rpclSystemTaskManagerAdjust;
rpSystemSpawnTasks = [rpSystemSpawnTasks, [], {_x select 4}, "ASCEND", {true}] call BIS_fnc_sortBy;
format ['Added task with handle %1', _taskID] call rpclLog;
rpSystemTaskID = rpSystemTaskID + 1;

_taskID