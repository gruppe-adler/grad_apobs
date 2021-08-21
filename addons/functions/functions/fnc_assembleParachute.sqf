#include "script_component.hpp"

params ["_target"];

private _parachute = "GRAD_APOBS_Parachute" createVehicle [0,0,0];

_parachute attachTo [_target, [0,-0.32,0]];
_parachute animate ["parachute_unfold", 1];
_target setVariable [QGVAR(parachute), _parachute, true];

private _frontpack = _target getVariable [QGVAR(frontpack), objNull];
if !(isNull _frontpack) then {
    {
        ropeDestroy _x;
    }forEach ropes _target;
    private _rocket = _frontpack getVariable [QGVAR(rocket), objNull];
    if (isNull _rocket) then {
        ropeCreate [_parachute, "ropeAttach", _frontpack, [0,0,0], APOBS_ROPE_LENGTH];
    } else {
        ropeCreate [_rocket, [0,0,0], _parachute, "ropeAttach", APOBS_ROPE_LENGTH];
        ropeCreate [_parachute, "ropeAttach", _target, [0,0,0], APOBS_ROPE_LENGTH2];
    };
};
