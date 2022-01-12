#include "script_component.hpp"
/*
 * Author: Salbei
 * Assemble the chute.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_assembleParachute
 *
 * Public: No
 */

params ["_target"];

//Create the parachute and attach it to the rearpack
private _parachute = "GRAD_APOBS_Parachute" createVehicle [0,0,0];
_parachute attachTo [_target, [0,0.8,0.5]];
_parachute setVectorDirAndUp [[1,0,0],[1,1,0.4]];
_parachute animate ["parachute_unfold", 1];
//_parachute hideObjectGlobal true;
_target setVariable [QGVAR(parachute), _parachute, true];

test_parachute = _parachute;
test_rearpack = _target;

//If possible create the ropes, needed to connect to the front part
private _frontpack = _target getVariable [QGVAR(frontpack), objNull];
if !(isNull _frontpack) then {
    {
        ropeDestroy _x;
    }forEach (ropes _target);

    private _rocket = _frontpack getVariable [QGVAR(rocket), objNull];
    if (isNull _rocket) then {
        ropeCreate [_parachute, "ropeAttach", _frontpack, [0,0,0],APOBS_ROPE_LENGTH_LONG, ["", [0,0,-1]], ["", [0,0,-1]], "Grad_APOBS_Rope"];
    } else {
        ropeCreate [_rocket, [0,0,0], _parachute, "ropeAttach",APOBS_ROPE_LENGTH_LONG, ["", [0,0,-1]], ["", [0,0,-1]], "Grad_APOBS_Rope"];
        ropeCreate [_parachute, "ropeAttach", _target, [0,0,0], APOBS_ROPE_LENGTH_SHORT, ["", [0,0,-1]], ["", [0,0,-1]], "Grad_APOBS_Rope"];
    };
};
