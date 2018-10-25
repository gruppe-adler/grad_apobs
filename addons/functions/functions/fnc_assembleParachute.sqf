#include "script_component.hpp"

params ["_target"];

private _parachute = "grad_apobs_parachute" createVehicle (getPosWorld _target);

_target setVariable [QGVAR(parachute), _parachute, true];
