#include "script_component.hpp"
/*
 * Author: Salbei
 * Disassemble rocket.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_disassembleRocket
 *
 * Public: No
 */

params ["_target"];

private _rocket = _target getVariable [QGVAR(rocket), objNull];
deleteVehicle _rocket;

ACE_PLAYER addItem "GRAD_APOBS_rocketPacked";

// If item does not fit in the inventory, create it on the ground
if !("GRAD_APOBS_rocketPacked" in items ACE_PLAYER ) then {

};
