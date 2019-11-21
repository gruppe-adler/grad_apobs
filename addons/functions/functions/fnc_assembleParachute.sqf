#include "script_component.hpp"

params ["_target"];

private _parachute = "GRAD_APOBS_Parachute" createVehicle [0,0,0];

_parachute attachTo [_target, [0,0.32,1]];
_target setVariable [QGVAR(parachute), _parachute, true];
