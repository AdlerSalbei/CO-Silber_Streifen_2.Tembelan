params ["_respawn", "_newPos"];

if (isNil "_newPos" || {!(_newPos isEqualType [])}) then {_newPos = [0,0,0];};

_respawn setMarkerPos _newPos;
