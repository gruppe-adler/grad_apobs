#include "script_component.hpp"

params ["_unit"];

private _backpackType = (backpack _unit);

if !(_backpackType in ["Grad_APOBS_Frontpack","Grad_APOBS_Rearpack"]) exitWith {};

removeBackpack _unit;

private _offset = if ((_unit call CBA_fnc_getUnitAnim select 0) == "prone") then { 1 } else { 0.8 };
private _pos = _unit modelToWorld [0, _offset, 0];

private _obj = createVehicle [(format ["%1_closed", _backpackType]), _pos, [], 0, "CAN_COLLIDE"];
_obj setPos _pos;
_obj setVariable [QGVAR(isClosed), true, true];

_unit reveal _obj;

[_obj, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
[_obj, true, [0,1,0], 0] call ace_dragging_fnc_setDraggable;

test_apobs = _obj;
