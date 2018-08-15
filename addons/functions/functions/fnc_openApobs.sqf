#include "script_component.hpp"

params ["_target"];

_target animate ["open", 1];
_target setVariable [QGVAR(isOpen), true, true];
