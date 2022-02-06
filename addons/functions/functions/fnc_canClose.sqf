#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the APOBS can be closed.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can close <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canClose
 *
 * Public: No
 */

params ["_target"];

if (_target getVariable [QGVAR(isClosed), true]) exitWith { false };
if !(isNull (_target getVariable [QGVAR(connector), objNull])) exitWith { false };
if !(isNull (_target getVariable [QGVAR(rocket), objNull])) exitWith { false };
if !(isNull (_target getVariable [QGVAR(parachute), objNull])) exitWith { false };
if (_target getVariable [QGVAR(fired), false]) exitWith { false };

true
