#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the chute can be disassembled.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can disassemble <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canDisassembleParachute
 *
 * Public: No
 */

params ["_target"];

if (_target getVariable [QGVAR(isClosed), true]) exitWith { false };
if (isNull (_target getVariable [QGVAR(parachute), objNull])) exitWith { false };

true
