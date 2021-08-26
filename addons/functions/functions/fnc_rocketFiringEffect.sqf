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

// Fire
private _ps1 = "#particlesource" createVehicleLocal [0,0,0];
_ps1 attachTo [_rocket, [0, 0, -0.05]];

_ps1 setParticleParams [
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 10, 32], 
	"", 
	"Billboard",
	1, 
	1, 
	[0, 0, 0],
	[0, 0, 0.5], 
	0, 
	1, 
	1, 
	3, 
	[0.5,1.5],
	[[1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],
	[0.25,1], 
	1, 
	1, 
	"", 
	"", 
	_ps1
];
_ps1 setParticleRandom [
	0.2, 
	[0.5, 0.5, 0.25], 
	[0.125, 0.125, 0.125], 
	0.2, 0.2, [0, 0, 0, 0], 
	0, 
	0
];
_ps1 setDropInterval 0.05;

// Smoke
private _ps2 = "#particlesource" createVehicleLocal [0,0,0];
_ps2 attachTo [_rocket, [0, 0, -0.05]];
_ps2 setParticleParams [
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 1, 1], 
	"", 
	"Billboard",
	1, 
	5, 
	[0, 0, 1], 
	[0, 0, 1.5], 
	0, 
	1, 
	1, 
	0.5, 
	[1.75,2,3,4.5], // timerPeriod → size
	[[1,1,1,0], [1,1,1,0.5], [1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],
	[0.5,0.5], 
	0, 
	0, 
	"", 
	"", 
	_ps2
];
_ps2 setParticleRandom [
	0.5, 
	[1, 1, 0.4], 
	[0, 0, 0.5], 
	0, 0.125, 
	[0, 0, 0, 0], 
	rad 30, 
	0
];
_ps2 setDropInterval 0.1;


