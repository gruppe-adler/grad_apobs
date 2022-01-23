#include "script_component.hpp"
/*
 * Author: Salbei
 * Fires the rocket, wich pulls the breaching line behind it.
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

params ["_target"];

private _rearpack = _target getVariable [QGVAR(rearpack), objNull];
private _rocket = _target getVariable [QGVAR(rocket), objNull];
private _parachute = _rearpack getVariable [QGVAR(parachute), objNull];
private _prevRopeSegments = _target getVariable [QGVAR(prevRopeSegments), []];

[{
    params ["_rocket","_parachute","_rearpack", "_prevRopeSegments"];

    _rearpack allowDamage false;  
    _parachute allowDamage false;  
    _rocket allowDamage false;  
    
    detach _rocket;
    detach _parachute;
              
    [{
        params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];

        count (_rocket nearObjects ["Grad_APOBS_Rope_Segment", 50]) > count _prevRopeSegments 
    },{
        params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];
        private _breachLineSegments = +((_rocket nearObjects ["Grad_APOBS_Rope_Segment", 50]) - _prevRopeSegments); 
        private _vector = [_rocket vectorModelToWorld [0.6,0,1.95], [0,0,0]];
        [{
            params ["_args", "_handle"];
            _args params ["_rocket", "_vector", "_time"];

            if (diag_tickTime > (_time + 1.8)) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
            };

            _rocket addForce _vector;
        }, 0.1, [_rocket, _vector, diag_tickTime]] call CBA_fnc_addPerFrameHandler;

        [QGVAR(rocketFX), [_rocket]] call CBA_fnc_globalEvent;
        
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

        [{
            _this hideObjectGlobal false; 
        }, _parachute, 2] call CBA_fnc_waitAndExecute;

        [{
            [{
                (getPos _this) select 2 <= 0 
            },{
                _this setVelocity [0, 0, 0];
            }, _this] call CBA_fnc_waitUntilAndExecute; 
        }, _rocket, 2] call CBA_fnc_waitAndExecute;

        [{
            [{
                (getPos _this) select 2 <= 0 
            },{
                _this setVelocity [0, 0, 0];
            }, _this] call CBA_fnc_waitUntilAndExecute; 
        }, _parachute, 4] call CBA_fnc_waitAndExecute;

        [{
            params ["_rocket", "_parachute", "_rearpack", "_breachLineSegments"];
            {   
                "HelicopterExploSmall" createVehicle getPos _x;
            } forEach _breachLineSegments;

            [_breachLineSegments] call FUNC(destroyMines);

            private _ropes = ropes _rocket;
            _ropes append (ropes _parachute);
            _ropes append (ropes _rearpack);

            {
                ropeDestroy _x;
            }forEach _ropes;

            deleteVehicle _parachute;
            deleteVehicle _rocket;
        }, [_rocket, _parachute, _rearpack, _breachLineSegments], 9] call CBA_fnc_waitAndExecute;
    },[_rocket, _parachute, _rearpack, _prevRopeSegments]] call CBA_fnc_waitUntilAndExecute;
}, [_rocket, _parachute, _rearpack, _prevRopeSegments], 1] call CBA_fnc_waitAndExecute;
//}, [_rocket, _parachute, _rearpack, _prevRopeSegments], 15] call CBA_fnc_waitAndExecute;
