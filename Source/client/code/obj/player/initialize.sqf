private ['_newPlayerObj', '_oldPlayerObj'];
_newPlayerObj = _this;
_oldPlayerObj = player;

player reveal [_newPlayerObj, 4];
selectPlayer _newPlayerObj;

enableSentences false;
enableRadio false;
player setVariable ['BIS_noCoreConversations', true];
player disableConversation true;
player setSpeaker 'NoVoice';
showSubtitles false;

true