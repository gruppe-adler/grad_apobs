#include "script_component.hpp"
/*
 * Author: Salbei
 * Set up rocket.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_setUpRocket
 *
 * Public: No
 */

params ["_target"];

private _rocket = "grad_apobs_rocket" createVehicle [0,0,0];

_rocket attachTo [_target, [-0.04, 0.36, 0.02]];
_rocket setVectorDirAndUp [[180,20,0],[0,0.5,0.5]];

_target setVariable [QGVAR(rocket), _rocket, true];

[_target, false, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
[_target, false, [0,1,1], 0] call ace_dragging_fnc_setDraggable;

private _rearpack = _target getVariable [QGVAR(rearpack), objNull];
if !(isNull _rearpack) then {
    {
        ropeDestroy _x;
    }forEach ropes _rearpack;
    
    private _parachute = _rearpack getVariable [QGVAR(parachute), objNull];
    if (isNull _parachute) then {
        ropeCreate [_rocket, [0,0,0], _rearpack, [0,0,0], APOBS_ROPE_LENGTH];
    } else {
        ropeCreate [_rocket, [0,0,0], _parachute, [0,0,0], APOBS_ROPE_LENGTH];
        ropeCreate [_parachute, [0,0,0], _rearpack, [0,0,0], APOBS_ROPE_LENGTH2]; 
    };
};
