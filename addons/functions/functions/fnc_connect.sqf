/*
private _pos = _player modelToWorld [1,-1,0];
private _dir = getDir _player;

private _connector = createVehicle ["Grad_APOBS_Connector_F", _pos, [], 0, "CAN_COLLIDE"];
_connector setDir _dir;
_connector setPos _pos;

_target setVariable [QGVAR(rearpack), _rearpack,true];
*/

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_object", objNull, [objNull]]
];

[
    2,
    [_unit, _object],
    {
        params ["_args"];
        _args params ["_unit", "_object"];

        if !([_unit, _object] call FUNC(canTakeConnector)) exitWith {};

        private _source = _object;
        private _connector = _object;
        if (typeOf _object isEqualTo "Grad_APOBS_Connector_F") then { // func is called on connector either connected or on ground
            _source = _connector getVariable QGVAR(source);
            _connector attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];
        } else { // func is called on APOBS
            _connector = "Grad_APOBS_Connector_F" createVehicle [0,0,0];
            _connector attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];

            private _ropeTarget = _source;
            if !(_source isKindOf "AllVehicles") then {
                private _helper = QGVAR(helper) createVehicle [0,0,0];
                [ace_common_hideObjectGlobal, [_helper, true]] call CBA_fnc_serverEvent;
                if ((getText (configFile >> "CfgVehicles" >> typeOf _source >> "simulation")) isEqualTo "thingX") then {
                    _helper attachTo [_source, [0,0,0]];
                } else {
                    _helper setPosWorld (getPosWorld _source);
                    _helper setDir (getDir _source);
                    _helper setVectorUp (vectorUp _source);
                };
                _connector setVariable [QGVAR(helper), _helper, true];
                _ropeTarget = _helper;
            };
            private _attachPos = _source getVariable [QGVAR(hooks), getArray (configFile >> "CfgVehicles" >> typeOf _source >> QGVAR(hooks))];
            if (_attachPos isEqualTo []) then {
                _attachPos = [[0,0,0]];
            };
            if (count _attachPos == 1) then {
                _attachPos = _attachPos select 0;
            } else {
                // select closest hook
                private _hookDistances = _attachPos apply {_unit distance (_source modelToWorld _x)};
                _attachPos = _attachPos select (_hookDistances find selectMin _hookDistances);
            };
            private _hoseLength = _source getVariable [QGVAR(hoseLength), GVAR(hoseLength)];
            private _rope = ropeCreate [_ropeTarget, _attachPos, _connector, [0, -0.20, 0.12], _hoseLength];
            _connector setVariable [QGVAR(rope), _rope, true];
            _connector setVariable [QGVAR(attachPos), _attachPos, true];
            _connector setVariable [QGVAR(source), _source, true];

            _source setVariable [QGVAR(isConnected), true, true];
            _source setVariable [QGVAR(connector), _connector, true];
        };

        _unit setVariable [QGVAR(connector), _connector, true];
        _unit setVariable [QGVAR(isConnecting), true];

        // holster weapon
        _unit setVariable [QGVAR(selectedWeaponOnConnecting), currentWeapon _unit];
        _unit call ace_common_fnc_fixLoweredRifleAnimation;
        _unit action ["SwitchWeapon", _unit, _unit, 299];

        [_unit, "forceWalk", "Grad_APOBS_connecting", true] call ace_common_fnc_statusEffect_set;
        [_unit, "blockThrow", "Grad_APOBS_connecting", true] call ace_common_fnc_statusEffect_set;

        [_unit, _connector] call FUNC(startConnectorInHandsPFH);
    },
    {},
    localize LSTRING(TakeConnectorAction),
    {true},
    [INTERACT_EXCEPTIONS_REFUELING]
] call ace_common_fnc_progressBar);
