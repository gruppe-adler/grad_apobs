#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_object", objNull, [objNull]]];

if (isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _object} ||
    {!isNull (_unit getVariable [QGVAR(connector), objNull])} ||
    {typeOf _object == QGVAR(fuelconnector) && {!isNull (attachedTo _object)}} || // Not carried by someone else
    {([_unit, _object] call EFUNC(interaction,getInteractionDistance)) > REFUEL_ACTION_DISTANCE}) exitWith {false};

!(_object getVariable [QGVAR(isConnected), false]) && {!(_unit getVariable [QGVAR(isRefueling), false])}
