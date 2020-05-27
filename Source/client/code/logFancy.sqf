/*
	log.sqf

	Params:
		_message: String
		[_message:String, _type:String]
	
	Usage:
		"STRING Message" call rpclLog;
*/
private ['_message', '_type'];

if((typeName _this) isEqualTo 'ARRAY') then {
	_message = _this select 0;
	_type = _this select 1;
} else {
	_message = _this;
	_type = 'INFO';
};

switch (_type) do {
	case 'WARN': {
		diag_log 'RPMOD:WARNING ----------------------------------------------------------------------';
		diag_log _message;
		diag_log '------------------------------------------------------------------------------------';
	};
	case 'ERROR': {
		diag_log 'RPMOD:ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
		diag_log format ["%1", _message];
		diag_log '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
	};
	default {
		diag_log format ['RPMOD: %1', _message];
	};
};