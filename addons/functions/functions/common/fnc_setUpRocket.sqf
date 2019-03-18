#include "script_component.hpp"

params ["_target"];

private _rocket = "grad_apobs_rocket" createVehicle [0,0,0];

_rocket attachTo [_target,[0,0,0]]; 

_target setVariable [QGVAR(rocket), _rocket, true];
