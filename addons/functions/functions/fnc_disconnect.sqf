#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_connector", objNull, [objNull]]];

private _rearpack = _connector getVariable [QGVAR(rearpack), objNull];
if (isNull _rearpack) exitWith {};

_rearpack setVariable [QGVAR(connector), nil, true];
_connector setVariable [QGVAR(rearpack), nil, true];
_connector setVariable [QGVAR(isConnected), false, true];
[objNull, _connector, true] call FUNC(dropConnector);

[_unit, _connector] call FUNC(takeConnector);
