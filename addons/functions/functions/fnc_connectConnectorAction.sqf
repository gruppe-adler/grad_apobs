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
        ropeDestroy ((ropes _source) select 0);
        detach _connector;
        deleteVehicle _connector;

        private _rocket = _source getVariable [QGVAR(rocket), objNull]; 
        private _parachute = _rearpack getVariable [QGVAR(parachute), objNull];

        private _from = _source;
        private _to = _rearpack;

        if !(isNull _rocket) then {
            _from = _rocket;      
        };

        if !(isNull _parachute) then {
            _to = _parachute;      
        };

        ropeCreate [_from, [0,0,0], _to, [0,0,0], APOBS_ROPE_LENGTH];

        _source setVariable [QGVAR(rearpack), _rearpack, true];
        _source setVariable [QGVAR(isConnected), true, true];

        _rearpack setVariable [QGVAR(isConnected), true, true];
        _rearpack setVariable [QGVAR(frontpack), _source, true];
    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    [INTERACT_EXCEPTIONS_APOBS]
] call ace_common_fnc_progressBar;
