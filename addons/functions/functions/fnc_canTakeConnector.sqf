#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_object", objNull, [objNull]]];

if (isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _object} ||
    {!isNull (_unit getVariable [QGVAR(connector), objNull])} ||
    {typeOf _object == "Grad_APOBS_Connector_F" && {!isNull (attachedTo _object)}} || // Not carried by someone else
    {([_unit, _object] call ace_interaction_fnc_getInteractionDistance)) > (getNumber(configFile >> "Grad_APOBS_Frontpack_closed" >> "connectorLengt"))}) exitWith {false};

!(_object getVariable [QGVAR(isConnected), false])
