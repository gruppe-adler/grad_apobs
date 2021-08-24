#include "script_component.hpp"
/*
 * Author: Salbei
 * Pick up APOBS.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_takeApobs
 *
 * Public: No
 */

params ["_unit", "_target"];

private _type = typeOf _target;

deleteVehicle _target;

private _split = _type splitString "_";
_split deleteAt (count _split -1);
_type = _split joinString "_";

_unit addBackpack _type;
