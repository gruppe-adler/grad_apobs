#include "script_component.hpp"

params ["_breachLineSegments", "_rocket"];

private _allMines = allMines;
{
	private _mine = _x;
	{
		if (( _mine distance2D _x) <= APOBS_MINE_DESTRUCTION_RANGE) then {
			_mine setDamage 1;
		};
	}forEach _breachLineSegments
}forEach _allMines;
