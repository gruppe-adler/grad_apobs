#include "script_component.hpp"

params ["_target"];

systemChat "Boom";

private _rearpack = _target getVariable [QGVAR(rearpack), objNull];
private _rocket = _target getVariable [QGVAR(rocket), objNull];
private _parachute = _rearpack getVariable [QGVAR(parachute), objNull];

systemChat format ["Rear: %1, Rock: %2, Para: %3", _rearpack, _rocket, _parachute];

_rearpack allowDamage false;
_parachute allowDamage false;
_rocket allowDamage false;

_rearpack setMass 1;
_parachute setMass 1;
_rocket setMass 1;

[{
    params ["_rocket","_parachute","_rearpack"];

    private _prevRopeSegments = +(_rocket nearObjects ["ropesegment", 50]);
    ro1 = ropeCreate [_rocket,"back",_parachute,"front",45];

    [{ count ((_this select 0) nearObjects ["ropesegment", 50]) > count (_this select 1)},{
        params ["_rocket","_prevRopeSegments","_parachute","_rearpack"];

         private _breachLineSegments = [];
         _breachLineSegments = ((_rocket nearObjects ["ropesegment", 50]) - _prevRopeSegments);

         ropeCreate [_parachute,"front",_rearpack,"back",7];
         _rocket addForce [_object vectorModelToWorld [0,25.5,25.5],[1,0,0]];

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
