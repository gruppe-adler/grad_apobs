#include "script_component.hpp"

params ["_target"];

_target animate ["open", 0];
_target setVariable [QGVAR(isOpen), false, true];
