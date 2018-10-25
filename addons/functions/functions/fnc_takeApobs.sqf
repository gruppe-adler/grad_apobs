params ["_unit", "_target"];

private _type = typeOf _target;

deleteVehicle _target;

private _split = _type splitString "_";
_split deleteAt (count _split -1);
_type = _split joinString "_";

_unit addBackpack _type;
