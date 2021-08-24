#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the APOBS can be disconnected form one another.
 *
 * Arguments:
 * 0: Rearpack <OBJECT>
 *
 * Return Value:
 * Can disconnect <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canDisconnect
 *
 * Public: No
 */

params [["_rearpack", objNull, [objNull]]];

if !(_rearpack getVariable [QGVAR(isConnected), false]) exitWith { false };
if (isNull (_rearpack getVariable [QGVAR(rope), objNull])) exitWith { false };
if (isNull (_rearpack getVariable [QGVAR(frontpack), objNull])) exitWith { false };

true
