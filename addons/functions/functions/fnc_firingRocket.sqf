#include "script_component.hpp"
/*
 * Author: Salbei
 * Fires the rocket
 *
 * Arguments:
 * 0: Rocket <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_firingRocket
 *
 * Public: No
 */

if !(isServer) exitWith {};

params ["_rocket"];

// Add sound to rocket
private _soundSource = createSoundSource ["Sound_Missile", getPos _rocket, [], 0];
_soundSource attachTo [_rocket, [0, -0.05, 0]];

private _vector = [_rocket vectorModelToWorld [0.6,0,1.95], [0,0,0]];
[{
    params ["_args", "_handle"];
    _args params ["_rocket", "_vector", "_time", "_soundSource"];

    if (diag_tickTime > (_time + 1.8)) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        deleteVehicle _soundSource;
    };

    _rocket addForce _vector;
}, 0.1, [_rocket, _vector, diag_tickTime, _soundSource]] call CBA_fnc_addPerFrameHandler;

[QGVAR(rocketFX), [_rocket]] call CBA_fnc_globalEvent;

[{
    [{
        (getPos _this) select 2 <= 0
    },{
        _this setVelocity [0, 0, 0];
    }, _this] call CBA_fnc_waitUntilAndExecute;
}, _rocket, 2] call CBA_fnc_waitAndExecute;
