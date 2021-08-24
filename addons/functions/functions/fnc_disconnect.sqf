#include "script_component.hpp"
/*
 * Author: Salbei
 * Disconnect the APOBS.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Rearpack <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player, obj] call grad_apobs_functions_fnc_disconnect
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_rearpack", objNull, [objNull]]];

private _frontpack = _rearpack getVariable [QGVAR(frontpack), objNull];
ropeDestroy (_rearpack getVariable [QGVAR(rope), objNull]);

_rearpack setVariable [QGVAR(frontpack), objNull, true];
_rearpack setVariable [QGVAR(rope), objNull, true];
_rearpack setVariable [QGVAR(isConnected), false, true];

_frontpack setVariable [QGVAR(rearpack), objNull, true];
_frontpack setVariable [QGVAR(isConnected), false, true];
_frontpack setVariable [QGVAR(rope), objNull, true];

[_unit, _frontpack] call FUNC(connect);
