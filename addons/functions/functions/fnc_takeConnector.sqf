#include "script_component.hpp"
/*
 * Author: GitHawk, Salbei
 * Take a connector either from a APOBS pack or from the ground.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Connector <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call grad_apobs_functions_fnc_takeConnector
 *
 * Public: No
 */

params ["_unit", "_connector"];

_unit setVariable [QGVAR(selectedWeaponOnConnecting), currentWeapon _unit];
_unit call ace_common_fnc_fixLoweredRifleAnimation;
_unit action ["SwitchWeapon", _unit, _unit, 299];

[_unit, "forceWalk", "Grad_APOBS_connecting", true] call ace_common_fnc_statusEffect_set;
[_unit, "blockThrow", "Grad_APOBS_connecting", true] call ace_common_fnc_statusEffect_set;

_connector attachTo [_unit, [-0.02, -0.01, 0.01], "righthandmiddle1"];

_connector setVariable [QGVAR(isConnecting), true, true];
_unit setVariable [QGVAR(isConnecting), true];
_unit setVariable [QGVAR(connector), _connector, true];

[_unit, _connector] call FUNC(connectingPFH);
