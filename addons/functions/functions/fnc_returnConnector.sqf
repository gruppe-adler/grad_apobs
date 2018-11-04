#include "script_component.hpp"
/*
 * Author: GitHawk, Jonpas
 * Returns the connector back to source vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, fuelTruck] call grad_apobs_functions_fnc_returnConnector
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

private _connector = _unit getVariable [QGVAR(connector), objNull];

if (isNull _connector || {_source != _connector getVariable QGVAR(source)}) exitWith {};

[
    1,
    [_unit, _connector, _source],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_connector", objNull, [objNull]], ["_source", objNull, [objNull]]];
        _unit setVariable [QGVAR(connector), nil, true];
        detach _connector;
        _unit setVariable [QGVAR(isRefueling), false];

        _source setVariable [QGVAR(isConnected), false, true];
        _source setVariable [QGVAR(connector), nil, true];
        private _rope = _connector getVariable [QGVAR(rope), objNull];
        if !(isNull _rope) then {
            ropeDestroy _rope;
        };
        private _helper = _connector getVariable [QGVAR(helper), objNull];
        if !(isNull _helper) then {
            deleteVehicle _helper;
        };
        deleteVehicle _connector;
    },
    "",
    localize LSTRING(ReturnAction),
    {true},
    [INTERACT_EXCEPTIONS]
] call ace_common_fnc_progressBar;
