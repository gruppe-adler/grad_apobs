#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {"Grad_APOBS_Frontpack", "Grad_APOBS_Rearpack", "Grad_APOBS_Frontpack_closed", "Grad_APOBS_Rearpack_closed", "Grad_APOBS_Connector", "Grad_APOBS_Rocket", "Grad_APOBS_Parachute"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { QMAINPATCH };
        authors[] = { "DerZade [A]","Salbei" };
        VERSION_CONFIG;
    };
};

#include <CfgVehicles.hpp>
#include <CfgNonAIVehicles.hpp>