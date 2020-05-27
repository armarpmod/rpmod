if(rpSystemTaskDelays isEqualTo []) then { rpSystemTaskDelays = [5]; };

rpSystemTaskDelays = rpSystemTaskDelays call BIS_fnc_sortNum;
rpSystemSleepTime = (((rpSystemTaskDelays select 0) max 0.01) min 5);

true