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

private _pos = getpos _rocket;
_pos params ["_posX","_posY","_posZ"];

drop [
	["\A3\data_f\ParticleEffects\Universal\Universal",16,2,32], 
	"", 
	"Billboard", 
	1,
	(0.1 + random 0.1),
	[0, 0, 0],
	[0, -2, 0], 
	0, 
	10, 
	7.9, 
	0.075, 
	[1,3],
	[[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 0.5, 1, -0]],
	[5], 
	1, 
	0, 
	"", 
	"", 
	_rocket
];

private _colour = [[0.7,0.7,0.7,0], [0.7,0.7,0.7,0.5], [0.7,0.7,0.7,0.4], [0.8,0.8,0.8,0.3], [0.9,0.9,0.9,0.15], [1,1,1,0]];

for "_i" from 0 to 8 do
{
	drop [
		["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48], 
		"", 
		"Billboard", 
		1, 
		1.5, 
		[0, 0, 0],
		[-0.2 + random 0.2, -0.6*_i + random 0.5, -0.2 + random 0.2], 
		1, 
		1, 
		0.80, 
		0.4, 
		[0.4,(0.8*_i)+random 0.2],
		_colour,
		[2,0.7,0.5],
		0.1,
		0.1,
		"",
		"",
		_rocket
	];
};

private _vector = vectordir _rocket;
_vector params ["_vectorX", "_vectorY", "_vectorZ"];

private _pos1 = "#particlesource" createVehicleLocal [0,0,0];
_pos1 attachTo [_rocket, [0, -0.05, 0]];

_pos1 setParticleParams [
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 3, 1, 0], 								// File,Ntieth,Index,Count,Loop
	"", 																							// Animation
	"Billboard",																					// Type 	
	1, 																								// TimerPer 
	0.08, 																							// Lifetime 
	[0,0,0], 																						// Position 
	[-_vectorX * 0.25, -_vectorY, -_vectorZ * 0.25], 												// MoveVelocity 
	1,																								// rotationVel 	
	1.275,																							// weight 	
	1, 																		   						// volume 
	0, 																								// rubbing 
	[0.1,0.3], 																						// Scale 
	[[0.4,0.4,0.4,-2], [0.4,0.4,0.4,-1], [0.4,0.4,0.4,-0.6],[0.4,0.4,0.4,-0.4], [0.4,0.4,0.4,0]],	// Color 
	[1000], 																						// AnimSpeed 	
	0.1, 																							// randDirPeriod 
	0.1, 																							// randDirIntensity 
	"", 																							// onTimerScript 
	"", 																							// DestroyScript 
	_pos1,																							// object 
	0.5,																							// angle
	false,																							// onSurface
	0																								// bounceOnSurface
];

_pos1 setParticleRandom [
	0.1, 																							// LifeTime 	
	[0.08,0.08,0.08], 																				// Position 	
	[0.3, 0.3, 0.3], 																				// MoveVelocity 
	20, 																							// rotationVel 
	0.2, 																							// Scale 	
	[0, 0, 0, 0], 																					// Color 	
	0, 																								// randDirPeriod 
	0,																								// randDirIntensity 
	0																								// Angle 
];

_pos1 setDropInterval 0.002;


// Remove effect when rocket motor stops
[{
	deleteVehicle _this;
}, _pos1, 1.8] call CBA_fnc_waitAndExecute; 
