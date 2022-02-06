#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the APOBS can be connected to another.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can connect <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_assembleParachute
 *
 * Public: No
 */

params ["_target"];

if (_target getVariable [QGVAR(isClosed), true]) exitWith { false };
if !(isNull (_target getVariable [QGVAR(rearpack), objNull])) exitWith { false };
if !(isNull (_target getVariable [QGVAR(connector), objNull])) exitWith { false };
if (_target getVariable [QGVAR(fired), false]) exitWith { false };

true
