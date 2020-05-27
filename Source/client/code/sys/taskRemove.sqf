private ['_taskID', '_result', '_taskIndex'];
_taskID = _this select 0;
_result = false;
_taskIndex = [rpSystemSpawnTasks, _taskID] call rpclUtilFind;

if(_taskIndex != -1) then {
	rpSystemTaskDelays deleteAt (rpSystemTaskDelays find ((rpSystemSpawnTasks select _taskIndex) select 0));
	[] call rpclSystemTaskManagerAdjust;
	rpSystemSpawnTasks deleteAt _taskIndex;
	result = true;
};

_result