class CfgPatches {};

class CfgMods {
    class Mod_Base;
    class RPMOD: Mod_Base {
        name = 'RPMOD';
        author = 'RPMOD Team';
        action = 'https://www.armarpmod.com';
        dir = '@rpmod';
        logo = '';
        logoOver = '';
        logoSmall = '';
        hidePicture = 0;
        hideName = 0;
        dlcColor[] = {1,1,1,1};
        version = '0.1.0';
        armaVersion = '180';
        overview = '';
        itemPrevNotifText = '';
    };
};

class CfgDifficultyPresets {
    class Veteran;
    defaultPreset = 'RPRegular';
    class RPRegular: Veteran {};
    class RPHardcore: Veteran {};
};

class CfgFunctions {};

class CfgNetworkMessages {
	class sessionStartResquest {
		module = 'SystemSession';
        parameters[] = { "STRING" };
	};
	class sessionStartResponse {
        module = 'SystemSession';
        parameters[] = { "STRING" };
    };
    class playerSaveRequest {
        module = 'ObjectPlayer';
        parameters[] = {};
    };
    class playerSaveResponse {
        module = 'ObjectPlayer';
        parameters[] = {};
    };
};

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;
        class rpsvSystemNetworkDispatch {
            allowedTargets = 2;
        };
    };
    class Commands { mode = 0; jip = 0; };
};

class CfgRespawnTemplates {
    class RPMOD {
        isCall = 1;
        onPlayerKilled = 'rpclObjectPlayerEventOnKilled';
        onPlayerRespawn = 'rpclObjectPlayerEventOnRespawn';
        respawnDelay = 30;
        respawnOnStart = 0;
        respawnButton = 1;
    };
};