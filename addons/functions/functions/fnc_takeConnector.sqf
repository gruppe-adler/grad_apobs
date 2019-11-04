#include "script_component.hpp"

params ["_unit","_connector"];

_connector attachTo [_unit, [-0.02, -0.01, 0.01], "righthandmiddle1"];

_connector setVariable [QGVAR(isConnecting), true, true];
_unit setVariable [QGVAR(isConnecting), true];
_unit setVariable [QGVAR(connector), _connector, true];

[_unit, _connector] call FUNC(connectingPFH);
