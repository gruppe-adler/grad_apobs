#include "script_component.hpp"

params ["_target"];

private _helper = attachedObjects _target;
if (_helper isEqualTo []) then {
	_helper = "ace_fastroping_helper" createVehicle [0,0,0];
	_helper disableCollisionWith _target;
	_helper attachTo [_target, [0,0,0]];
} else {
	_helper = _helper select 0;
};

private _parachute = "GRAD_APOBS_Parachute" createVehicle [0,0,0];

_parachute attachTo [_target, [0,0.32,1]];
_parachute animate ["parachute_unfold", 1];
_target setVariable [QGVAR(parachute), _parachute, true];

test_parachute = _parachute;

ropeCreate [_helper, [0,0,0], _parachute, [0,0,-1], 5];
