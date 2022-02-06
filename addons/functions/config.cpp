#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {"GRAD_APOBS_rocketPacked"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { QMAINPATCH , QUOTE(KPATCH(assets))};
        authors[] = AUTHORS;
        VERSION_CONFIG;
    };
};

#include <CfgEventHandlers.hpp>
#include <CfgAmmo.hpp>
#include <CfgSFX.hpp>
#include <CfgVehicles.hpp>
#include <CfgWeapons.hpp>
