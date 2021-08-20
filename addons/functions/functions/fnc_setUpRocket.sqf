#include "script_component.hpp"

params ["_target"];

_target hideSelection ["rocket", true];
private _rocket = "grad_apobs_rocket" createVehicle [0,0,0];

_rocket attachTo [_target, [0, -0.32, 0.05]];
[_rocket, 150, 0] call BIS_fnc_setPitchBank;

_target setVariable [QGVAR(rocket), _rocket, true];
private _helper = ropeAttachedTo _target;
if !(isNull _helper) then {
    {
        if (_x isEqualTo _target) exitWith {
            ropeDestroy ((ropes _helper) select _forEachIndex);

            ropeCreate [_helper, [0,0,0], _rocket, [0,0,0], 45];
        };
    }forEach (ropeAttachedObjects _helper);
};
