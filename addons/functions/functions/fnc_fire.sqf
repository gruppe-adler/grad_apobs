#include "script_component.hpp"

params ["_target"];

systemChat "Boom";

private _rearpack = _target getVariable [QGVAR(rearpack), objNull];
private _rocket = _target getVariable [QGVAR(rocket), objNull];
private _parachute = _rearpack getVariable [QGVAR(parachute), objNull];

private _connector = _target getVariable [QGVAR(connector), objNull];

private _ropes = [];
_ropes pushBack (ropes _target);
_ropes pushBack (ropes _rearpack);
_ropes pushBack (ropes _connector);

systemChat str _ropes;

{
    ropeDestroy _x;
}forEach _ropes;
deleteVehicle _connector;

systemChat format ["Rear: %1, Rock: %2, Para: %3", _rearpack, _rocket, _parachute];

[{
    params ["_rocket","_parachute","_rearpack"];

    ro1 = ropeCreate [_rocket, [0,0,0],_parachute, [0,0,0], 45];

    [{ count ((_this select 0) nearObjects ["ropesegment", 50]) > count (_this select 1)},{
        params ["_rocket","_prevRopeSegments","_parachute","_rearpack"];

         ropeCreate [_parachute, [0,0,0],_rearpack, [0,0,0], 7];
         _rocket addForce [_rocket vectorModelToWorld [0,25.5,25.5],[1,0,0]];

        [{
            params ["_breachLineSegments"];
            private _counter = 0;
            {
                private _pos = (getPos _x);
                if (_pos distance (_pos nearestObject "GrenadeHand") > 0.8) then {
                     "GrenadeHand" createVehicle (getPos _x);
                    _counter = _counter +1;
                };
            } forEach _breachLineSegments;

        },[_breachLineSegments],7] call CBA_fnc_waitAndExecute;
    },[_rocket,_prevRopeSegments,_parachute,_rearpack]] call CBA_fnc_waitUntilAndExecute;
},[_rocket,_parachute,_rearpack],1] call CBA_fnc_waitAndExecute;
