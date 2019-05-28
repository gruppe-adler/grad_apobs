#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_rearpack", objNull, [objNull]], ["_connector", objNull, [objNull]]];

[
    2,
    [_unit, _connector, _rearpack],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_connector", objNull, [objNull]], ["_rearpack", objNull, [objNull]]];
        _unit setVariable [QGVAR(connector), objNull, true];

        private _source = _connector getVariable [QGVAR(source), objNull];
        private _helper2 = (attachedObjects _source) select 0;

        ropeDestroy ((ropes _helper2) select 0);
        detach _connector;

        _connector setDir (_source getDir _rearpack);

        private _helper = "ace_fastroping_helper" createVehicle [0,0,0];
        _helper attachTo [_rearpack, [0,0,0]];

        private _rope = ropeCreate [_helper, [0,0,0], _connector, [0,0,0], (round(_helper distance _connector))];
        private _rope2 = ropeCreate [_helper2, [0,0,0], _connector, [0,0,0], (ceil(_helper2 distance _connector))];

        _source setVariable [QGVAR(rearpack), _rearpack, true];
        _source setVariable [QGVAR(isConnected), true, true];

        _rearpack setVariable [QGVAR(isConnected), true, true];
        _rearpack setVariable [QGVAR(helper), _helper, true];
        _rearpack setVariable [QGVAR(frontpack), _source, true];

    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    [INTERACT_EXCEPTIONS]
] call ace_common_fnc_progressBar;
