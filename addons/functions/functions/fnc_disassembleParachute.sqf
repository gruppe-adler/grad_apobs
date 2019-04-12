#include "script_component.hpp"

params ["_target"];

private _parachute = _target getVariable [QGVAR(parachute), objNull];
deleteVehicle _parachute;
_target setVariable [QGVAR(parachute), objNull, true];
