//#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

//TRACE_1("enter", _this);
params ["_args"];
_args params ["_laserTarget", "_shooter", "_uuid"];

if(isNull _laserTarget || !alive _shooter) exitWith {
    [(_this select 1)] call CBA_fnc_removePerFrameHandler;
    REM(GVAR(VanillaLasers), _laserTarget);

    // Remove laseron
    [_uuid] call FUNC(laserOff);
};

#ifdef DEBUG_MODE_FULL
// Iconize the location of the actual laserTarget
_pos = getPosASL _laserTarget;
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoATL _pos), 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];

{
    drawLine3D [ASLtoATL (_x select 0), ASLtoATL (_x select 1), (_x select 2)];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", (_x select 2), ASLtoATL (_x select 1), 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];
} forEach DRAW_LINES;
DRAW_LINES = [];
#endif
