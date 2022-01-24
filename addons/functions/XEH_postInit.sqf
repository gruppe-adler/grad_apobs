#include "script_component.hpp"

if (isServer) then {
	[QGVAR(fire), {_this call FUNC(fire);}] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;

[QGVAR(rocketFX), {_this call FUNC(rocketFiringEffect);}] call CBA_fnc_addEventHandler;
