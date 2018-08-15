#include "script_component.hpp"

params [["_object", objnull, [objNull]]];

[_object, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
[_object, true, [0,1,1], 0] call ace_dragging_fnc_setDraggable;
