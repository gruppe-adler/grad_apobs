#include "script_component.hpp"

params ["_target"];

if !(_target getVariable [QGVAR(isOpen),false]) exitWith {false};
if !(isNull (_target getVariable [QGVAR(rearpack), objNull])) exitWith {false};
if !(isNull (_target getVariable [QGVAR(connector), objNull])) exitWith {false};

true
