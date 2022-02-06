#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the rocket can be set up.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can set up <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canSetUpRocket
 *
 * Public: No
 */

params ["_target", "_unit"];

if (_target getVariable [QGVAR(isClosed), true]) exitWith { false };
if !(isNull (_target getVariable [QGVAR(rocket), objNull])) exitWith { false };
if (_target getVariable [QGVAR(fired), false]) exitWith { false };

if !("GRAD_APOBS_rocketPacked" in items _unit) exitWith {false};

true
