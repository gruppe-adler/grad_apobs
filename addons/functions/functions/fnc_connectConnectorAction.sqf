#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_rearpack", objNull, [objNull]], ["_startingPosASL", [0,0,0], [[]], 3], ["_connector", objNull, [objNull]]];

private _bestPosASL = [];
private _bestPosDistance = 1e99;
private _viewPos = _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0,0,1])) vectorMultiply 3);
private _modelVector = _startingPosASL vectorFromTo (AGLtoASL (_rearpack modelToWorld [0,0,0]));
private _modelVectorLow = _startingPosASL vectorFromTo (AGLtoASL (_rearpack modelToWorld [0,0,-1]));

{
    private _endPosASL = _x;
    private _intersections = lineIntersectsSurfaces [_startingPosASL, _endPosASL, _unit];
    {
        _x params ["_intersectPosASL", "", "_intersectObject"];
        if (_intersectObject == _rearpack) then {
            private _distance = _startingPosASL distance _intersectPosASL;
            if (_distance < _bestPosDistance) then {
                _bestPosDistance = _distance;
                _bestPosASL = _intersectPosASL;
            };
        };
    } forEach _intersections;
} forEach [
    // Shoot rays towards player's view angle and see which spot is closest
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0,0,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [-0.25,0,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0.25,0,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0,-0.25,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [-0.25,-0.25,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0.25,-0.25,1])) vectorMultiply 3),
    AGLtoASL (_rearpack modelToWorld [0,0,0]), // Try old method of just using model center
    AGLtoASL (_rearpack modelToWorld [0,0,-0.5])
];

//Checks (too close to center or can't attach)
if (_bestPosASL isEqualTo []) exitWith {
    [localize LSTRING(Failed)] call ace_common_fnc_displayTextStructured;
};

//Move it out slightly, for visibility sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_bestPosASL = _bestPosASL vectorAdd ((_bestPosASL vectorFromTo _startingPosASL) vectorMultiply 0.05);

private _attachPosModel = _rearpack worldToModel (ASLtoAGL _bestPosASL);

[
    2,
    [_unit, _connector, _rearpack, _attachPosModel],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_connector", objNull, [objNull]], ["_rearpack", objNull, [objNull]], ["_endPosTestOffset", [0,0,0], [[]], 3]];
        _unit setVariable [QGVAR(connector), nil, true];
        _unit setVariable [QGVAR(isRefueling), false];

        detach _connector;
        _connector attachTo [_rearpack, _endPosTestOffset];
        _endPosTestOffset params ["_x", "_y"];
        private _bb = boundingBoxReal _rearpack;
        _bb params ["_ll", "_rr"];
        _ll set [2, 0];
        _rr set [2, 0];
        _ll params ["_x1", "_y1"];
        _rr params ["_x2", "_y2"];
        private _c1 = _ll vectorCos _endPosTestOffset;
        private _c2 = _ll vectorCos [_x1, _y2, 0];
        private _cn = (_ll vectorCrossProduct [0, 0, 1]) vectorCos _endPosTestOffset;
        private _dirAndUp = [[1, 0, 0],[0, 0, 1]];
        if (_c1 > _c2 && (_cn > 0)) then {
            _dirAndUp = [[1, 0, 0.8],[0, 0, 1]];
        } else {
            _c1 = [_x1, _y2, 0] vectorCos _endPosTestOffset;
            _c2 = [_x1, _y2, 0] vectorCos _rr;
            _cn = ([_x1, _y2, 0] vectorCrossProduct [0, 0, 1]) vectorCos _endPosTestOffset;
            if (_c1 > _c2 && (_cn > 0)) then {
                _dirAndUp = [[0, -1, 0.8],[0, 0, 1]];
            } else {
                _c1 = _rr vectorCos _endPosTestOffset;
                _c2 = _rr vectorCos [_x2, _y1, 0];
                _cn = (_rr vectorCrossProduct [0, 0, 1]) vectorCos _endPosTestOffset;
                if (_c1 > _c2 && (_cn > 0)) then {
                    _dirAndUp = [[-1, 0, 0.8],[0, 0, 1]];
                } else {
                    _dirAndUp = [[0, 1, 0.8],[0, 0, 1]];
                };
            };
        };
        ["ace_common_setVectorDirAndUp", [_connector, _dirAndUp], _connector] call CBA_fnc_targetEvent;
        _connector setVariable [QGVAR(rearpack), _rearpack, true];
        _connector setVariable [QGVAR(isConnected), true, true];
        _rearpack setVariable [QGVAR(connector), _connector, true];
    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    [INTERACT_EXCEPTIONS]
] call ace_common_fnc_progressBar;
