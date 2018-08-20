#include "script_component.hpp"

params ["_target"];

_target animate ["open", 0];
_target setVariable [QGVAR(isOpen), false, true];

[{_this animationPhase "open" == 0},{
    private _target = _this;

    private _targetClass = typeOf _target;
    private _pos = getPos _target;
    private _dir = getDir _target;
    private _vectorDir = vectorDir _target;
    private _vectorUp = vectorUp _target;

    private _str = _targetClass splitString "_";
    private _newClass = ("Grad_APOBS_" + (_str select 3));

    deleteVehicle _target;
    private _newPack = _newClass createVehicle _pos;
    _newPack setDir _dir;
    _newPack setPos _pos;
    _newPack setVectorDirAndUp [_vectorDir,_vectorUp];

    _newPack setVariable [QGVAR(isOpen), false, true];
},_target] call CBA_fnc_waitUntilAndExecute;
