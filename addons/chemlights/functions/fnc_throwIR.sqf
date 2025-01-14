/*
 * Author: voiper
 * Create and throw IR chemlight.
 *
 * Arguments:
 * 0: Original throw projectile <OBJECT>
 * 1: Class of projectile <STRING>
 * 2: Adv throw (default: false) <BOOL><OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_projectile, _ammoType] call ace_chemlights_fnc_throwIR;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_projectile", "_ammo", ["_replaceAdvThrowable", false]];

private _config = configFile >> "CfgAmmo" >> _ammo;
private _dummyClass = getText (_config >> "ACE_Chemlight_IR");
private _pos = getPosATL _projectile;
private _velocity = velocity _projectile;

deleteVehicle _projectile;
private _dummy = _dummyClass createVehicle _pos;
_dummy setPosATL _pos;
[_dummy, 90, 0] call BIS_fnc_setPitchBank;
_dummy setVelocity _velocity;

if (_replaceAdvThrowable) then {
    ace_player setVariable [QEGVAR(advancedThrowing,activeThrowable), _dummy];
};
