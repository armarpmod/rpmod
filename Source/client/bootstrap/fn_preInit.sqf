/**
 * Pre-Initialization
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ['_code', '_function', '_file', '_fileContent', '_isLocked'];

{
	_code = '';
	_function = _x select 0;
	_file = _x select 1;
	_isLocked = _x select 2;

	if(_isLocked isEqualTo false) then {
		if(isText(missionConfigFile >> 'CfgRPModCustomCode' >> _function)) then {
			_file = getText(missionConfigFile >> 'CfgRPModCustomCode' >> _function);
			_override = true;
		};
	};

	_fileContent = preprocessFileLineNumbers _file;

	if(_fileContent isEqualTo '') then {
		diag_log (format ['ERROR: Attempt to override %1 FAILED, file does not exist %2', _function, _file]);
	
		_fileContent = preprocessFileLineNumbers (_x select 1);		
	};
	_code = compileFinal _fileContent;

	missionNamespace setVariable [_function, _code];
} forEach [
	['rpclGuiHudInitialize','rpmod_client\code\gui\hud\initialize.sqf',false],
	['rpclLog','rpmod_client\code\log.sqf',false],
	['rpclLogFancy','rpmod_client\code\logFancy.sqf',false],
	['rpclObjItemConsume','rpmod_client\code\object\item\consume.sqf',false],
	['rpclObjItemUse','rpmod_client\code\object\item\use.sqf',false],
	['rpclObjPlayerEventOnHandleDamage','rpmod_client\code\object\player\event\onHandleDamage.sqf',false],
	['rpclObjPlayerEventOnKilled','rpmod_client\code\object\player\event\onKilled.sqf',false],
	['rpclObjPlayerEventOnRespawn','rpmod_client\code\object\player\event\onRespawn.sqf',false],
	['rpclObjPlayerInitialize','rpmod_client\code\object\player\initialize.sqf',false],
	['rpclSysNetworkDispatch','rpmod_client\code\system\network\dispatch.sqf',false],
	['rpclSysNetworkSend','rpmod_client\code\system\network\send.sqf',false],
	['rpclSysProcessGameOver','rpmod_client\code\system\processGameOver.sqf',false],
	['rpclSysProcessPostInit','rpmod_client\code\system\processPostInit.sqf',false],
	['rpclSysProcessPreInit','rpmod_client\code\system\processPreInit.sqf',false],
	['rpclSysTaskAdd','rpmod_client\code\system\taskAdd.sqf',false],
	['rpclSysTaskManagerAdjust','rpmod_client\code\system\taskManagerAdjust.sqf',false],
	['rpclSysTaskManagerInitialize','rpmod_client\code\system\taskManagerInit.sqf',false],
	['rpclSysTaskRemove','rpmod_client\code\system\taskRemove.sqf',false],
	['rpclUtilFind','rpmod_client\code\util\find.sqf',false]
];

call rpclSystemProcessPreInit;

true