#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_rearpack", objNull, [objNull]], ["_connector", objNull, [objNull]]];

[
    2,
    [_unit, _connector, _rearpack],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_connector", objNull, [objNull]], ["_rearpack", objNull, [objNull]]];
        _unit setVariable [QGVAR(connector), objNull, true];

        diag_log format ["Unit: %1, Connector: %2, Rearpack: %3", _unit, _connector, _rearpack];

        private _frontHelper = ropeAttachedObjects _connector;
        private _source = _connector getVariable [QGVAR(source), objNull];

        {
           ropeDestroy _x;
        }forEach (ropes _connector);

        deleteVehicle _connector;
        private _helper = "ace_fastroping_helper" createVehicle [0,0,0];
        _helper attachTo [_rearpack, [0,0,0]];

        private _rope = ropeCreate [_helper, [0,0,0], _frontHelper, [0,0,0], (ceil(_helper distance _frontHelper))];

        _source setVariable [QGVAR(rearpack), _rearpack, true];
        _source setVariable [QGVAR(isConnected), true, true];
        _source setVariable [QGVAR(rope), _rope, true];
        _source setVariable [QGVAR(connector), objNull, true];

        _rearpack setVariable [QGVAR(isConnected), true, true];
        _rearpack setVariable [QGVAR(rope), _rope, true];
        _rearpack setVariable [QGVAR(frontpack), _source, true];

    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    [INTERACT_EXCEPTIONS]
] call ace_common_fnc_progressBar;
