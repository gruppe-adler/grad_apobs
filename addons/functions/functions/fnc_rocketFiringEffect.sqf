#include "script_component.hpp"
/*
 * Author: Salbei
 * Effect for the rocket firing.
 *
 * Arguments:
 * 0: Rocket <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_rocketFiringEffect
 *
 * Public: No
 
*/
params ["_rocket"];

[nil,nil,nil,nil,nil,nil, _rocket] call BIS_fnc_effectFiredRocket;

// Smoke
private _ps2 = "#particlesource" createVehicleLocal [0,0,0];
_ps2 attachTo [_rocket, [0, 0, -0.05]];
_ps2 setParticleParams [
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 8, 0], 			// File,Ntieth,Index,Count,Loop
	"", 																		// Animation
	"Billboard",																// Type 	
	1, 																			// TimerPer 
	1, 																			// Lifetime 
	[0, 0, 1], 																	// Position 
	[0, 0, 0], 																	// MoveVelocity 
	1,																			// rotationVel 	
	2.5,																		// weight 	
	1.7, 																		// volume 
	0.5, 																		// rubbing 
	[0.2,0.8], 																	// Scale 
	[[0.8,0.8,0.8,0.8], [0.9,0.9,0.9,0.4], [1,1,1,0]],							// Color 
	[1], 																		// AnimSpeed 	
	0.1, 																		// randDirPeriod 
	0.1, 																		// randDirIntensity 
	"", 																		// onTimerScript 
	"", 																		// DestroyScript 
	_ps2																		// object 
];

_ps2 setParticleRandom [
	0, 																			// LifeTime 	
	[0, 0, 0], 																	// Position 	
	[0.4, 0.4, 0.4], 															// MoveVelocity 
	20, 																		// rotationVel 
	0, 																			// Scale 	
	[0, 0, 0, 0], 																// Color 	
	0, 																			// randDirPeriod 
	0,																			// randDirIntensity 
	0																			// Angle 
];

_ps2 setDropInterval 0.0026;

[{
	[{
		(getPos (_this select 0)) select 2 <= 0 
	},{
		params ["_rocket", "_effectSpawner"];
		
		_rocket setVelocity [0, 0, 0];
		deleteVehicle _effectSpawner;
	}, _this] call CBA_fnc_waitUntilAndExecute; 
}, [_rocket, _effectSpawner], 2] call CBA_fnc_waitAndExecute;