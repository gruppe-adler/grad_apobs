#include "script_component.hpp"

params ["_target"];

private _rocket = "grad_apobs_rocket" createVehicle (getPosWorld _target);

_target setVariable [QGVAR(rocket), _rocket, true];
