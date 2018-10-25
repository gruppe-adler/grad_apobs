#include "script_component.hpp"

params ["_target"];

private _pos = (getPosWorld _target);
private _parachute = "GRAD_APOBS_Parachute" createVehicle _pos;


_target setVariable [QGVAR(parachute), _parachute, true];
