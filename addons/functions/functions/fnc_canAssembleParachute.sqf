#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the chute can be assembled.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can assemble <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canAssembleParachute
 *
 * Public: No
 */

params ["_target"];

if (_target getVariable [QGVAR(isClosed), true]) exitWith { false };
if !(isNull (_target getVariable [QGVAR(parachute), objNull])) exitWith { false };
if (_target getVariable [QGVAR(fired), false]) exitWith { false };

true
