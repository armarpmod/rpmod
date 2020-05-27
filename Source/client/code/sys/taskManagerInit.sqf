/*
	taskManagerInit.sqf
*/

rpSystemSpawnTasks = [];
rpSystemTaskDelays = [];
rpSystemMainTimer = time;
rpSystemSleepTime = 0.01;
rpSystemTaskID = 10000;

if !(rpSystemTaskManagerIsRunning isEqualTo true) then {
	[] spawn {
		rpSystemTaskManagerIsRunning = true;
		waitUntil {!isNil 'rpClientLoadedIn'};
		'Task Manager has started' call rpclLog;
		while {true} do {
			if !(rpSystemSpawnTasks isEqualTo []) then {
				{} forEach rpSystemSpawnTasks;
			};
			onEachFrame {};
			rpSystemMainTimer = time;
			uiSleep rpSystemSleepTime;
		};
		'Task Manager has stopped' call rpclLog;
		rpSystemTaskManagerIsRunning = false;
	};
} else { 'Trying to start another task manager thread' call rpclLog; };