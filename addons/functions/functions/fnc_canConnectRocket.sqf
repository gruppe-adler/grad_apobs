#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the rocket can be connected.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can connect rocket <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canConnectRocket
 *
 * Public: No
 */

params ["_target"];

if (_target getVariable [QGVAR(isClosed), true]) exitWith { false };
if (isNull (_target getVariable [QGVAR(rocket), objNull])) exitWith { false };
if !(_target getVariable [QGVAR(rocketConnected), false]) exitWith { false };
if (_target getVariable [QGVAR(fired), false]) exitWith { false };

true
