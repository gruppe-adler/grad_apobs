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

test_rocket = _rocket;
test_target = _target;

[{
    params ["_rocket","_parachute","_rearpack", "_prevRopeSegments"];

    _rearpack allowDamage false;  
    _parachute allowDamage false;  
    _rocket allowDamage false;  
  
    _rearpack setMass 1;  
    _parachute setMass 1;  
    _rocket setMass 1;
    
    detach _rocket;
    detach _parachute;
              
    [{
        params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];

        count (_rocket nearObjects ["Grad_APOBS_Rope_Segment", 50]) > count _prevRopeSegments 
    },{
        params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];
        private _breachLineSegments = +((_rocket nearObjects ["Grad_APOBS_Rope_Segment", 50]) - _prevRopeSegments); 
        private _vector = [_rocket vectorModelToWorld [0.4,0,2], [1,0,0]];
        [{
            params ["_args", "_handle"];
            _args params ["_rocket", "_vector", "_time"];

            if (diag_tickTime > (_time + 1.9)) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
            };

            _rocket addForce _vector;
        }, 0.1, [_rocket, _vector, diag_tickTime]] call CBA_fnc_addPerFrameHandler;
        
        //#ifdef DEBUG_MODE_FULL
            private _handle = [{  
                params ["_args"]; 
                _args params ["_rocket", "_rearpack", "_parachute"];  
                
                private _helper =  "Sign_Sphere25cm_F" createVehicle [0,0,0];
                _helper setPosASL (getPosASL _rocket);
                
                private _helper2 =  "Sign_Sphere25cm_F" createVehicle [0,0,0];
                _helper2 setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,0,0,1.0,ca)"];
                _helper2 setPosASL (getPosASL _rearpack);

                private _helper2 =  "Sign_Sphere25cm_F" createVehicle [0,0,0];
                _helper2 setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,0,1,1.0,ca)"];
                _helper2 setPosASL (getPosASL _parachute);
            
            }, 0, [_rocket, _rearpack, _parachute]] call CBA_fnc_addPerFrameHandler;  
            
            [{_this call CBA_fnc_removePerFrameHandler;}, [_handle], 25] call CBA_fnc_waitAndExecute; 
        //#endif

        [{
            _this hideObjectGlobal false;
        }, _parachute, 1] call CBA_fnc_waitAndExecute;

        [{
            [{
                (getPos _this) select 2 <= 0 
            },{
                _this setVelocity [0, 0, 0];
            }, _this] call CBA_fnc_waitUntilAndExecute; 
        }, _rocket, 2] call CBA_fnc_waitAndExecute;

        [{
            params ["_rocket", "_parachute", "_rearpack", "_breachLineSegments"];
            {  
                private _pos = (getPos _x);  
                if (_pos distance2D (_pos nearestObject "GrenadeHand") > 2) then {  
                    //"GrenadeHand" createVehicle (getPos _x);   
                    "GrenadeExplosion" createVehicle (getPos _x);
                };  
            } forEach _breachLineSegments; 

            private _ropes = ropes _rocket;
            _ropes append (ropes _parachute);
            _ropes append (ropes _rearpack);

            {
                ropeDestroy _x;
            }forEach _ropes;

            deleteVehicle _parachute;
            deleteVehicle _rocket;
        }, [_rocket, _parachute, _rearpack, _breachLineSegments], 7] call CBA_fnc_waitAndExecute;
    },[_rocket, _parachute, _rearpack, _prevRopeSegments]] call CBA_fnc_waitUntilAndExecute;
    }, [_rocket, _parachute, _rearpack, _prevRopeSegments], 1] call CBA_fnc_waitAndExecute;
//}, [_rocket, _parachute, _rearpack, _prevRopeSegments], 15] call CBA_fnc_waitAndExecute;
