#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the connector can be returned.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can return <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canReturnConnector
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

private _connector = _unit getVariable [QGVAR(connector), objNull];

(!isNull _connector) &&
{([_unit, _source] call ace_interaction_fnc_getInteractionDistance) < 7} &&
{_source == (_connector getVariable [QGVAR(source), objNull])}
