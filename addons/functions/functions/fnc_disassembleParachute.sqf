#include "script_component.hpp"

params ["_target"];

private _parachute = _target getVariable [QGVAR(parachute), objNull];

if (isNull _parachute) exitWith {};
