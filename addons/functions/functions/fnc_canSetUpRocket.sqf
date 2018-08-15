#include "script_component.hpp"

params ["_target"];

if (_target getVariable [QGVAR(isOpen), false]) exitWith {false};
if !(isNull (_target getVariable [QGVAR(rocket), objNull])) exitWith {false};

true
