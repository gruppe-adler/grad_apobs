#include "script_component.hpp"

if (!hasInterface) exitWith {};

["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;

[QGVAR(rocketFX), {_this call FUNC(rocketFiringEffect);}] call CBA_fnc_addEventHandler;
