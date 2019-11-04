#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

[
    2,
    [_unit, _source],
    {
        params ["_args"];
        _args params ["_unit", "_source"];

        if !([_unit, _source] call FUNC(canTakeConnector)) exitWith {diag_log "GRAD APOBS: Exit Connect";};

        private _connector = _source;

        if ((typeOf _source) isEqualTo "Grad_APOBS_Connector") then {          // func is called on connector either connected or on ground
            _source = _connector getVariable QGVAR(source);
            _connector attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];
        } else {                                                                 // func is called on APOBS
            _connector = "Grad_APOBS_Connector" createVehicle [0,0,0];
            private _helper = "ace_fastroping_helper" createVehicle [0,0,0];

            test_connector = _connector;
            _connector attachTo [_unit, [-0.02,-0.01,0.01], "righthandmiddle1"];
            _helper attachTo [_source, [0,0,0]];

            private _hoseLength = _source getVariable [QGVAR(hoseLength), (getNumber (configfile >> "CfgVehicles" >> "Grad_APOBS_Frontpack_closed" >> "connectorLength" >> "defaultValue"))];
            private _rope = ropeCreate [_helper, [0,0,0], _connector, [0,-0.01,0], _hoseLength];

            _connector setVariable [QGVAR(rope), _rope, true];
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

        [_unit, _connector] call FUNC(connectingPFH);
    },
    {},
    localize LSTRING(TakeConnectorAction),
    {true},
    [INTERACT_EXCEPTIONS_APOBS]
] call ace_common_fnc_progressBar;
