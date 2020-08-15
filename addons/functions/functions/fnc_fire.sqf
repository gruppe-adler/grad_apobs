#include "script_component.hpp"

params ["_target"];

private _rearpack = _target getVariable [QGVAR(rearpack), objNull];
private _rocket = _target getVariable [QGVAR(rocket), objNull];
private _parachute = _rearpack getVariable [QGVAR(parachute), objNull];
private _connector = _target getVariable [QGVAR(connector), objNull];

diag_log format ["1: Rearpack: %1, Rocket: %2, Parachute: %3, Connector: %4", _rearpack, _rocket, _parachute, _connector];

[{
    params ["_target", "_rocket","_parachute","_rearpack", "_connector"];
    systemChat "Step 1";

    private _oldHelper = (attachedObjects _target) select 0;

    ropeDestroy ((ropes _oldHelper) select 0);
    deleteVehicle _connector;
    deleteVehicle _oldHelper;

    detach _parachute;

    test_rocket = _rocket;

    [{
        params ["_rocket", "_parachute"];

        diag_log format ["3: Rocket: %1, Parachute: %2", _rocket, _parachute];

        private _helper = "ace_fastroping_helper" createVehicle [0,0,0];
        _helper attachTo [_rocket, [0,0,0]];
        test_helper = _helper;

        private _helper2 = "ace_fastroping_helper" createVehicle [0,0,0];
        _helper2 attachTo [_parachute, [0,0,0]];

        private _rope = ropeCreate [_helper2, [0,0,0], _helper, [0,0,0], 45];
        diag_log format ["New Rope R2P: %1", _rope];
    }, [_rocket, _parachute]] call CBA_fnc_execNextFrame;

    diag_log format ["2: Rocket: %1, Parachute: %2, Rearpack: %3", _rocket, _parachute, _rearpack];

    [{
        params ["_rocket", "_parachute", "_rearpack"];
        
        systemChat "Step 2";
        diag_log "Step 2";
        diag_log format ["4: Rocket: %1, Parachute: %2, Rearpack: %3", _rocket, _parachute, _rearpack];

        private _prevRopeSegments = _rocket nearObjects ["ropesegment", _parachute distance _rocket];
        diag_log format ["5: prevRopeSegments: %1", _prevRopeSegments];

        systemChat format ["Helper: %1", _rearpack getVariable QGVAR(helper)];
        diag_log format ["Helper: %1", _rearpack getVariable QGVAR(helper)];

        if !(isNil "_rearpack") then {
            ropeCreate [_parachute, [0,0,0], (_rearpack getVariable QGVAR(helper)), [0,0,0], 7];
        };

        detach _rocket;
        [{_this setVelocity (_this vectorModelToWorld [0, 0, -10])}, _rocket] call CBA_fnc_execNextFrame;

        [{
            private _velocity = (_this select 0);
            systemChat format ["Velo: %1", _velocity];

            (((_velocity select 0) > 0) || {(_velocity select 1) > 0})
        }, 
        {
            [
                {
                    private _velocity = velocity (_this select 0);

                    systemChat format ["Velo: %1, Bool: %2", _velocity, (((_velocity select 0)<= 0) && {(_velocity select 1)<= 0} && {(_velocity select 2)<= 0})];

                    (((_velocity select 0) <= 0) && {(_velocity select 1) <= 0} && {(_velocity select 2) <= 0})
                },{
                    params ["", "_rearpack", "_prevRopeSegments"];

                    systemChat "Boom";
                    diag_log "Step 3";
                    diag_log format ["6: Rearpack: %1, prevRopeSegments: %2", _rearpack, _prevRopeSegments];

                    private _counter = 0;
                    {
                        private _pos = (getPos _x);
                        if (_pos distance (_pos nearestObject "R_60mm_HE") > 0.8) then {
                            "R_60mm_HE" createVehicle _pos;
                            _counter = _counter +1;
                        };
                    } forEach _prevRopeSegments;

                    diag_log format ["Spawned %1 Granades", _counter];
                }, 
                _this, 
                7,
                {
                    params ["", "_rearpack", "_prevRopeSegments"];

                    systemChat "Timeout";
                    systemChat "Boom";
                    diag_log "Step 3";
                    diag_log format ["7: Rearpack: %1, prevRopeSegments: %2", _rearpack, _prevRopeSegments];

                    private _counter = 0;
                    {
                        private _pos = (getPos _x);
                        if (_pos distance (_pos nearestObject "GrenadeHand") > 0.8) then {
                            "GrenadeHand" createVehicle (getPos _x);
                            _counter = _counter +1;
                        };
                    } forEach _prevRopeSegments;

                    diag_log format ["Spawned %1 Granades", _counter];
                }  
            ] call CBA_fnc_waitUntilAndExecute;
        }, [_rocket, _rearpack, _prevRopeSegments]] call CBA_fnc_waitUntilAndExecute;
    }, [_rocket, _parachute, _rearpack], 0.05] call CBA_fnc_waitAndExecute;
}, [_target, _rocket, _parachute, _rearpack, _connector], 1] call CBA_fnc_waitAndExecute;
