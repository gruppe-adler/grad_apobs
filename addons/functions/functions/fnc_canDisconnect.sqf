#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_connector", objNull, [objNull]]];

if (isNull _unit ||
    {isNull _connector} ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!isNull (_unit getVariable [QGVAR(connector), objNull])} ||
    {(_connector distance _unit) > 7}) exitWith {false};

private _rearpack = _connector getVariable [QGVAR(rearpack), objNull];
!((isNull _rearpack) || {_connector getVariable [QGVAR(isConnecting), false]})
