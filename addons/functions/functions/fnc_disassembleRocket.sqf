#include "script_component.hpp"
/*
 * Author: Salbei
 * Disassemble rocket.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_disassembleRocket
 *
 * Public: No
 */

params ["_target"];

[
    5,
    _target,
    {
        params ["_target"];

        private _rocket = _target getVariable [QGVAR(rocket), objNull];
        deleteVehicle _rocket;

        _target setVariable [QGVAR(rocket), objNull];

        ACE_PLAYER addItem "GRAD_APOBS_rocketPacked";
    },
    {},
    localize LSTRING(dismantleRocketAction),
    {true},
    [INTERACT_EXCEPTIONS_APOBS]
] call ace_common_fnc_progressBar;
