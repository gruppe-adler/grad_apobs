#include "script_component.hpp"

params ["_target"];

if !(_target getVariable [QGVAR(firingSaftyPulled), false]) exitWith { false };
if (_target getVariable [QGVAR(firingPinPulled), false]) exitWith { false };

true
