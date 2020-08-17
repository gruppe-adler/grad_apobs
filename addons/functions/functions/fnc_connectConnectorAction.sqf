#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]], 
    ["_rearpack", objNull, [objNull]], 
    ["_connector", objNull, [objNull]]
];

[
    2,
    [_unit, _connector, _rearpack],
    {
        params ["_args"];
        _args params [
            ["_unit", objNull, [objNull]], 
            ["_connector", objNull, [objNull]], 
            ["_rearpack", objNull, [objNull]]
        ];

        _unit setVariable [QGVAR(connector), objNull, true];

        private _source = _connector getVariable [QGVAR(source), objNull];
        private _helper2 = ((attachedObjects _source) select {(typeOf _x) isEqualTo "ace_fastroping_helper"}) select 0;
        systemChat format ["Helper2 %1", _helper2];
        ropeDestroy ((ropes _helper2) select 0);
        deleteVehicle _helper2;
        detach _connector;
        deleteVehicle _connector;

        private _helper = attachedObjects _rearpack;
        if (_helper isEqualTo []) then {
            _helper = "ace_fastroping_helper" createVehicle [0,0,0];
            _helper disableCollisionWith _rearpack;
            _helper attachTo [_rearpack, [0,0,0]];
        } else {
            _helper = _helper select 0;
        }; 
        
        if !(isNull (_source getVariable [QGVAR(rocket), objNull])) then {
            ropeCreate [_helper, [0,0,0], (_source getVariable QGVAR(rocket)), [0,0,0], 45];
        } else {
            ropeCreate [_helper, [0,0,0], _source, [0,0,0], 45];
        };

        _source setVariable [QGVAR(rearpack), _rearpack, true];
        _source setVariable [QGVAR(isConnected), true, true];

        _rearpack setVariable [QGVAR(isConnected), true, true];
        _rearpack setVariable [QGVAR(helper), _helper, true];
        _rearpack setVariable [QGVAR(frontpack), _source, true];
    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    [INTERACT_EXCEPTIONS_APOBS]
] call ace_common_fnc_progressBar;
