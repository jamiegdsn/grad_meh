/*
 * Author: DerZade
 * Redraw the loading screen
 *
 * Arguments:
 * 0: Loading display <DISPLAY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [(uiNamespace getVariable "grad_meh_loadingDisplay")] call grad_meh_fnc_redrawLoading;
 *
 * Public: No
 */

#include "../idcmacros.hpp"

params ["_display"];

private _worlds = _display getVariable ["grad_meh_worlds", []];
private _loadingList = _display displayCtrl IDC_LOADINGLIST;

// clear loadingList 
{
	if (ctrlClassName _x isEqualTo "grad_meh_loadingItem") then {
		ctrlDelete _x;
	};
} forEach (allControls _display);


private _yPos = 0;
{
	private _item = [
		_display,
		_loadingList,
		_x
	] call (uiNamespace getVariable "grad_meh_fnc_createLoadingItem");

	_item ctrlSetPositionY _yPos;
	_item ctrlCommit 0;

	private _height = (ctrlPosition _item) select 3;
	_yPos = _yPos + _height;
} forEach _worlds;