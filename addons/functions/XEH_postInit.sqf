#include "script_component.hpp"

#define APOBS_MINE_DESTRUCTION_RANGE 5
#define APOBS_ROPE_LENGTH 50
#define APOBS_ROPE_LENGTH2 4.5

if (!hasInterface) exitWith {};

["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;
