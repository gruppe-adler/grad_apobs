#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_rearpack", objNull, [objNull]], ["_connector", objNull, [objNull]]];

[
    2,
    [_unit, _connector, _rearpack],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_connector", objNull, [objNull]], ["_rearpack", objNull, [objNull]]];
        _unit setVariable [QGVAR(connector), objNull, true];

        detach _connector;
        private _helper = "ace_fastroping_helper" createVehicle [0,0,0];
        _helper attachTo [_rearpack, [0,0,0]];
        private _rope = ropeCreate [_helper, [0,0,0], _connector, [0,0.01,0], 1];

        _source = _connector getVariable [QGVAR(source), objNull];
        _source setVariable [QGVAR(rearpack), _rearpack, true];
        _connector setVariable [QGVAR(isConnected), true, true];
        _connector setVariable [QGVAR(ropeBack), _rope, true];
        _rearpack setVariable [QGVAR(connector), _connector, true];
    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    [INTERACT_EXCEPTIONS]
] call ace_common_fnc_progressBar;
