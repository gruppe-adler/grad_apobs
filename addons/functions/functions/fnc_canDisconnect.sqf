#include "script_component.hpp"

params [["_rearpack", objNull, [objNull]]];

if !(_rearpack getVariable [QGVAR(isConnected), false]) exitWith { false };
if (isNull (_rearpack getVariable [QGVAR(rope), objNull])) exitWith { false };
if (isNull (_rearpack getVariable [QGVAR(frontpack), objNull])) exitWith { false };

true
