params ["_unit"];

private _backpackType = (backpack _unit);
systemChat str(_backpackType);
if !(_backpackType in ['Grad_APOBS_Frontpack','Grad_APOBS_Rearpack']) exitWith {};

removeBackpack _unit;

private _offset = if ((_unit call CBA_fnc_getUnitAnim select 0) == "prone") then { 1 } else {0.8};
private _pos = _unit modelToWorld [0,_offset,0];

private _obj = createVehicle [(format ["%1_closed", _backpackType]), _pos,[],0,"CAN_COLLIDE"];
_obj setPos _pos;

_unit reveal _obj;
systemChat "adding Dragable";
[_obj] call FUNC(initApobs);
