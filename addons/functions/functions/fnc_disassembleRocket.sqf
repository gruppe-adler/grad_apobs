#include "script_component.hpp"

params ["_target"];

private _rocket = _target getVariable [QGVAR(rocket), objNull];
deleteVehicle _rocket;

_target hideSelection ["rocket", false];
