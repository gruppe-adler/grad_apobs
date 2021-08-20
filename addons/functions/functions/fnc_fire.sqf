#include "script_component.hpp"

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

    [{
        params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];
         
        ropeCreate [_rocket, [0,0,0], _parachute, "ropeAttach", 45];  
    
        [{
            params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];
            count (_rocket nearObjects ["ropesegment", 50]) > count _prevRopeSegments 
        },{
            params ["_rocket", "_parachute", "_rearpack", "_prevRopeSegments"];
            private _breachLineSegments = +((_rocket nearObjects ["ropesegment", 50]) - _prevRopeSegments);  
    
            ropeCreate [_parachute, "ropeAttach", _rearpack, [0,0,0], 4.572];  
            _rocket setVelocity [0,20,25.5]; 

            _handle = [{  
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

            [{
                [{
                    (getPos _this) select 2 <= 0 
                },{
                    _this setVelocity [0, 0, 0];
                }, _this] call CBA_fnc_waitUntilAndExecute; 
            }, _rocket, 2] call CBA_fnc_waitAndExecute;

            [{
                {  
                    private _pos = (getPos _x);  
                    if (_pos distance (_pos nearestObject "GrenadeHand") > 0.8) then {  
                        _v = "GrenadeHand" createVehicle (getPos _x);   
                    };  
                } forEach _this; 
            }, _breachLineSegments, 7] call CBA_fnc_waitAndExecute;
        },[_rocket, _parachute, _rearpack, _prevRopeSegments]] call CBA_fnc_waitAndExecute;
    }, [_rocket, _parachute, _rearpack, _prevRopeSegments], 0.05] call CBA_fnc_waitAndExecute;
}, [_rocket, _parachute, _rearpack, _prevRopeSegments], 15] call CBA_fnc_waitAndExecute;
