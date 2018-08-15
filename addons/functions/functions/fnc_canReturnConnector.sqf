#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

private _connector = _unit getVariable [QGVAR(connector), objNull];

(!isNull _connector) &&
{([_unit, _source] call ace_interaction_fnc_getInteractionDistance) < 7} &&
{_source == (_connector getVariable [QGVAR(source), objNull])}
