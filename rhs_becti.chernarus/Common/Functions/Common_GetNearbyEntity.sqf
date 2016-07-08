/*
  # HEADER #
	Script: 		Common\Functions\CTI_CO_FNC_GetNearbyEntity.sqf
	Alias:			CTI_CO_FNC_GetNearbyEntity
	Description:	Finds one of the N closest positions among a list of positions/objects
	Author: 		manygrams, borrowing heavily from Benny
	Creation Date:	07-07-2016
	Revision Date:	07-07-2016

  # PARAMETERS #
    0	[Array/Object]: A position or an object which determine the center
    1	[Array]: The list (objects/positions)
		2 [Integer]: A number that specifies how many of the closest towns to sample from

  # RETURNED VALUE #
	[Object]: A random nearby position

  # SYNTAX #
	[CENTER, LIST, INTEGER] call CTI_CO_FNC_GetNearbyEntity

  # EXAMPLE #
    _closest = [player, [Town1, Town2, Town3], 1] call CTI_CO_FNC_GetNearbyEntity;
    _closest = [player, [Town1, [0,0,0], [50,50]], 3] call CTI_CO_FNC_GetNearbyEntity;
*/

private [ "_nearest", "_object", "_objects", "_list", "_n" ];

_object = _this select 0;
_objects = _this select 1;
_n = _this select 2;
_nearest = objNull;

if((count _objects) isEqualTo 0)exitWith{
	_nearest
};

_list=[];
{
	_list set [_forEachIndex,[_x distance _object,_x]];
}foreach _objects;

_list sort true;
_list = _list select [0, ((count _list) min _n)];
_nearest = ((selectRandom _list) select 1);

_nearest
