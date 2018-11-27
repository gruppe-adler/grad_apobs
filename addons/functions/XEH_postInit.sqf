#include "script_component.hpp"

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];
};

if (!hasInterface) exitWith {};

["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;
