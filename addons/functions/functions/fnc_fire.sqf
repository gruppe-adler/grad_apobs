#include "script_component.hpp"

params ["_target"];

private _rearpack = _target getVariable [QGVAR(rearpack)];
private _rocket = _target getVariable [QGVAR(rocket)];
private _parachute = _target getVariable [QGVAR(parachute)];

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
        private _breachLineSegments = +((_rocket nearObjects ["ropesegment", 50]) - _prevRopeSegments);

        ro2 = ropeCreate [_parachute,"front",_rearpack,"back",7];
        _rocket setVelocity [0,25.5,25.5];

        [{
            params ["_breachLineSegments"];
            private _counter = 0;
            {
                private _pos = (getPos _x);
                if (_pos distance (_pos nearestObject "GrenadeHand") > 0.8) then {
                    _v = "GrenadeHand" createVehicle (getPos _x);
                    _counter = _counter +1;
                };
            } forEach _breachLineSegments;

        },[_breachLineSegments],7] call CBA_fnc_waitAndExecute;
    },[_rocket,_prevRopeSegments,_parachute,_rearpack]] call CBA_fnc_waitUntilAndExecute;
},[_rocket,_parachute,_rearpack],1] call CBA_fnc_waitAndExecute;
