#include "script_component.hpp"

params ["_target"];

_target hideSelection ["rocket", true];
private _rocket = "grad_apobs_rocket" createVehicle [0,0,0];

test_rocket = _rocket;

_rocket attachTo [_target, [0, -0.32, 0.05]];
[_rocket, 150, 0] call BIS_fnc_setPitchBank;

_target setVariable [QGVAR(rocket), _rocket, true];
