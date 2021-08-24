#include "script_component.hpp"
/*
 * Author: GitHawk, Salbei
 * Take a connector either from a APOBS pack or from the ground.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Connector <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call grad_apobs_functions_fnc_takeConnector
 *
 * Public: No
 */

params ["_unit","_connector"];

_connector attachTo [_unit, [-0.02, -0.01, 0.01], "righthandmiddle1"];

_connector setVariable [QGVAR(isConnecting), true, true];
_unit setVariable [QGVAR(isConnecting), true];
_unit setVariable [QGVAR(connector), _connector, true];

[_unit, _connector] call FUNC(connectingPFH);
