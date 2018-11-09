#include "script_component.hpp"

params [["_unit", objNull, [objNull]],["_object", objNull, [objNull]]];

[
    2,
    [_unit, _object],
    {
        params ["_args"];
        _args params ["_unit", "_object"];

        if !([_unit, _object] call FUNC(canTakeConnector)) exitWith {};

        private _source = _object;
        private _connector = _object;
        if ((typeOf _object) isEqualTo "Grad_APOBS_Connector") then {          // func is called on connector either connected or on ground
            _source = _connector getVariable QGVAR(source);
            _connector attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];
        } else {                                                                 // func is called on APOBS
            _connector = "Grad_APOBS_Connector" createVehicle [0,0,0];
            _connector attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];

            private _attachPos = _connector selectionPosition "back" ;

            private _hoseLength = _source getVariable [QGVAR(hoseLength), (getNumber (configFile >> "Grad_APOBS_Frontpack_closed" >> "connectorLength"))];
            private _rope = ropeCreate [_source, [0,0,0], _connector, _attachPos, _hoseLength];
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
    [INTERACT_EXCEPTIONS_APOBS]
] call ace_common_fnc_progressBar;
