#include "script_component.hpp"
/*
 * Author: Salbei
 * Disassemble parachute.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_disassembleParachute
 *
 * Public: No
 */

params ["_target"];

[
    5,
    _target,
    {
        params ["_target"];

        private _parachute = _target getVariable [QGVAR(parachute), objNull];
        deleteVehicle _parachute;

        _target setVariable [QGVAR(parachute), objNull, true];

    },
    {},
    localize LSTRING(disassembleParachuteAction),
    {true},
    [INTERACT_EXCEPTIONS_APOBS]
] call ace_common_fnc_progressBar;
