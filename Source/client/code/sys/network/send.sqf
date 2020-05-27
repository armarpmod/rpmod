private ['_messageName', '_messageParameters', '_publicMessage'];
_messageName = _this select 0;
_messageParameters = [_this, 1, [], [[]]] call BIS_fnc_param;

_publicMessage = [rpSessionID, _messageName, _messageParameters];
_publicMessage remoteExecCall ['rpsvSystemNetworkDispatch', 2];
_publicMessage = nil;