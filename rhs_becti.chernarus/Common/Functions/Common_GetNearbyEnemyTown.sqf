/*
  # HEADER #
	Script: 		Common\Functions\Common_GetNearEnemyTown.sqf
	Alias:			CTI_CO_FNC_GetNearbyEnemyTown
	Description:	Get a nearby hostile town for a given side
	Author: 		manygrams, borrowing heavily from Benny's existing code
	Creation Date:	07-07-2016
	Revision Date:	07-07-2013

  # PARAMETERS #
    0	[Array/Object]: A position or an object which determine the center
    1	[Side/Integer]: The "friendly" side

  # RETURNED VALUE #
	[Object]: A nearby hostile town (null if none)

  # SYNTAX #
	[CENTER, FRIENDLY SIDE] call CTI_CO_FNC_GetNearbyEnemyTown

  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_ArrayPush
	Common Function: CTI_CO_FNC_GetNearbyEntity
	Common Function: CTI_CO_FNC_GetSideID

  # EXAMPLE #
    _closest = [player, CTI_P_SideID] call CTI_CO_FNC_GetNearbyEnemyTown;
*/

private ["_center", "_friendlySide", "_towns"];

_center = _this select 0;
_friendlySide = _this select 1;

if (typeName _friendlySide == "SIDE") then { _friendlySide = (_friendlySide) call CTI_CO_FNC_GetSideID };

_towns = [];
{if (_x getVariable "cti_town_sideID" != _friendlySide) then {_towns pushBack _x}} forEach CTI_Towns;

if (count _towns == 0) exitWith {objNull};

[_center, _towns, 4] call CTI_CO_FNC_GetNearbyEntity
