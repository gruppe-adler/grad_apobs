#include "script_component.hpp"
/*
 * Author: Salbei
 * Destroys mines in the path of the line.
 *
 * Arguments:
 * 0: Breach Line Segments <ARRAY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [[rope]] call grad_apobs_functions_fnc_destroyMines
 *
 * Public: No
 */

params ["_breachLineSegments"];

private _allMines = allMines;
{
    private _mine = _x;
    {
        if (( _mine distance2D _x) <= APOBS_MINE_DESTRUCTION_RANGE) then {
            _mine setDamage 1;
        };
    }forEach _breachLineSegments
}forEach _allMines;
