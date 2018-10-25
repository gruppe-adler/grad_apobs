#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_connector", objNull, [objNull]], ["_disconnectOnly", false, [false]]];

detach _connector;
_connector setVariable [QGVAR(isConnecting), false, true];

if (_disconnectOnly) exitWith {};
_connector setVelocity [0, 0, 0];

private _groundPosition = getPosASL _connector;
private _posA = (getPosASL _connector) vectorAdd [0,0,0.05];
private _posB = (getPosASL _connector) vectorAdd [0,0,-1000];
private _intersections = lineIntersectsSurfaces [_posA, _posB, _unit, _connector, true, 1, "GEOM"];
if (_intersections isEqualTo []) then {
    _groundPosition set [2, (getTerrainHeightASL _groundPosition) + 0.005];
} else {
    _groundPosition = ((_intersections select 0) select 0) vectorAdd [0,0,0.005];
};
_connector setPosASL _groundPosition;

if (isNull _unit) exitWith {};
_unit setVariable [QGVAR(isConnecting), false];
_unit setVariable [QGVAR(connector), objNull, true];
