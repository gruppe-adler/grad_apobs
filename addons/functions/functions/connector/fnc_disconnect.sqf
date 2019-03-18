#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_rearpack", objNull, [objNull]]];

private _frontpack = _rearpack getVariable [QGVAR(frontpack), objNull];
ropeDestroy (_rearpack getVariable [QGVAR(rope), objNull]);

_rearpack setVariable [QGVAR(frontpack), objNull,true];
_rearpack setVariable [QGVAR(rope), objNull,true];
_rearpack setVariable [QGVAR(isConnected), false,true];

_frontpack setVariable [QGVAR(rearpack), objNull, true];
_frontpack setVariable [QGVAR(isConnected), false, true];
_frontpack setVariable [QGVAR(rope), objNull, true];

[_unit, _frontpack] call FUNC(connect);
