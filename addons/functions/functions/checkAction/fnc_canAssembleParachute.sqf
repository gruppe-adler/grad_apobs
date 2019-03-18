#include "script_component.hpp"

params ["_target"];

if (_target getVariable [QGVAR(isClosed),true]) exitWith {false};
if !(isNull (_target getVariable [QGVAR(parachute), objNull])) exitWith {false};

true
