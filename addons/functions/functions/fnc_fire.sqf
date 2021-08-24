#include "script_component.hpp"
/*
 * Author: Salbei
 * Fires the rocket, wich pulls the breaching line bhind it.
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
  
    _rearpack setMass 1;  
    _parachute setMass 1;  
    _rocket setMass 1;

    detach _rocket;
    detach _parachute;
             
    [{
        params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];

        count (_rocket nearObjects ["ropesegment", 50]) > count _prevRopeSegments 
    },{
        params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];
        private _breachLineSegments = +((_rocket nearObjects ["ropesegment", 50]) - _prevRopeSegments);  

        _rocket addForce [[0,25,30], [1,0,0]];

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
                if (_pos distance (_pos nearestObject "GrenadeHand") > 1) then {  
                    "GrenadeHand" createVehicle (getPos _x);   
                };  
            } forEach _breachLineSegments; 

            private _ropes = ropes _rocket;
            _ropes append (ropes _parachute);
            _ropes append (ropes _rearpack);

            {
                ropeDestroy _x;
            }forEach _ropes;
        }, [_rocket, _parachute, _rearpack, _breachLineSegments], 7] call CBA_fnc_waitAndExecute;
    },[_rocket, _parachute, _rearpack, _prevRopeSegments]] call CBA_fnc_waitUntilAndExecute;
    }, [_rocket, _parachute, _rearpack, _prevRopeSegments], 1] call CBA_fnc_waitAndExecute;
//}, [_rocket, _parachute, _rearpack, _prevRopeSegments], 15] call CBA_fnc_waitAndExecute;
