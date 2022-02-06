#include "script_component.hpp"
/*
 * Author: Salbei
 * Goes through the firing sequence
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_fire
 *
 * Public: No
 */

if !(isServer) exitWith {};

params ["_target"];

private _rearpack = _target getVariable [QGVAR(rearpack), objNull];
private _rocket = _target getVariable [QGVAR(rocket), objNull];
private _parachute = _rearpack getVariable [QGVAR(parachute), objNull];

_target setVariable [QGVAR(fired), true, true];

if !(isNull _rearpack) then {
    _rearpack setVariable [QGVAR(fired), true, true];
};

[{
    params ["_rocket","_parachute","_rearpack"];

    detach _rocket;

    if !(isNull _parachute) then {
        detach _parachute;
    };

    [{
        params ["_rocket", "_parachute", "_rearpack"];

        [_rocket] call FUNC(firingRocket);

        // Used for debugging
        #ifdef DEBUG_MODE_FULL
            private _handle = [{
                params ["_args"];
                _args params ["_rocket", "_rearpack", "_parachute"];

                private _helper =  "Sign_Sphere25cm_F" createVehicle [0,0,0];
                _helper setPosASL (getPosASL _rocket);

                private _helper2 =  "Sign_Sphere25cm_F" createVehicle [0,0,0];
                _helper2 setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,0,0,1.0,ca)"];
                _helper2 setPosASL (getPosASL _rearpack);

                private _helper3 =  "Sign_Sphere25cm_F" createVehicle [0,0,0];
                _helper3 setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,0,1,1.0,ca)"];
                _helper3 setPosASL (getPosASL _parachute);

            }, 0, [_rocket, _rearpack, _parachute]] call CBA_fnc_addPerFrameHandler;

            [{_this call CBA_fnc_removePerFrameHandler;}, [_handle], 25] call CBA_fnc_waitAndExecute;
        #endif

        if !(isNull _parachute) then {
            [{
                _this hideObjectGlobal false;
            }, _parachute, 3] call CBA_fnc_waitAndExecute;

            [{
                [{
                    (getPos _this) select 2 <= 0
                },{
                    _this setVelocity [0, 0, 0];

                    [{
                        _this hideObjectGlobal false;
                    }, _this, 0.5] call CBA_fnc_waitAndExecute;
                }, _this] call CBA_fnc_waitUntilAndExecute;
            }, _parachute, 4] call CBA_fnc_waitAndExecute;
        };

        [{
            params ["_rocket", "_parachute", "_rearpack"];

            private _ropes = ropes _rocket;
            _ropes append (ropes _parachute);
            _ropes append (ropes _rearpack);

            if !(isNull _parachute) then {
                private _breachLineSegments = ropeSegments (_ropes select 0);

                for "_i" from 0 to (count _breachLineSegments) step 4 do {
                    QGVAR(explosion) createVehicle (getPos (_breachLineSegments select _i));
                };

                [_breachLineSegments] call FUNC(destroyMines);
            };

            [{
                params ["_rocket", "_parachute", "_ropes"];

                {
                    ropeDestroy _x;
                }forEach _ropes;

                deleteVehicle _parachute;
                deleteVehicle _rocket;
            }, [_rocket, _parachute, _ropes], 0.5] call CBA_fnc_waitAndExecute;
        }, [_rocket, _parachute, _rearpack], 7] call CBA_fnc_waitAndExecute;
    }, [_rocket, _parachute, _rearpack]] call CBA_fnc_execNextFrame;
}, [_rocket, _parachute, _rearpack], 15] call CBA_fnc_waitAndExecute;
