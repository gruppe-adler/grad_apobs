#include "script_component.hpp"

params ["_target"];

private _rearpack = _target getVariable [QGVAR(rearpack), objNull];
private _rocket = _target getVariable [QGVAR(rocket), objNull];
private _parachute = _rearpack getVariable [QGVAR(parachute), objNull];
private _connector = _target getVariable [QGVAR(connector), objNull];

systemChat format ["Rear: %1, Rock: %2, Para: %3", _rearpack, _rocket, _parachute];

[{
    params ["_rocket","_parachute","_rearpack", "_connector"];
    systemChat "Step 1";

    private _ropes = [];
    _ropes pushBack (ropes _target);
    _ropes pushBack (ropes _rearpack);
    _ropes pushBack (ropes _connector);

    systemChat str _ropes;

    {
        ropeDestroy _x;
    }forEach _ropes;
    deleteVehicle _connector;

    ropeCreate [_rocket, [0,0,0],_parachute, [0,0,0], 45];
    detach _parachute;
    [{
        params ["_rocket","_prevRopeSegments","_parachute","_rearpack"];
        systemChat "Step 2";
         ropeCreate [_parachute, [0,0,0],_rearpack, [0,0,0], 7];
         detach _rocket;
         _rocket addForce [_rocket vectorModelToWorld [0,25.5,25.5],[1,0,0]];

        [{
            systemChat "Boom";
            params ["_breachLineSegments"];
            private _counter = 0;
            {
                private _pos = (getPos _x);
                if (_pos distance (_pos nearestObject "GrenadeHand") > 0.8) then {
                     "GrenadeHand" createVehicle (getPos _x);
                    _counter = _counter +1;
                };
            } forEach _breachLineSegments;

        }, [_breachLineSegments], 7] call CBA_fnc_waitAndExecute;
    }, [_rocket, _parachute, _rearpack],0.3] call CBA_fnc_waitAndExecute;
}, [_rocket, _parachute, _rearpack, _connector], 1] call CBA_fnc_waitAndExecute;
