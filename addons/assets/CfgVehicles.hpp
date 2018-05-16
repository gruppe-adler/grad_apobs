class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Bag_Base;
    class Grad_APOBS_F: Bag_Base {
       //_generalMacro = QUOTE(ADDON);
       author = "DerZade [A] & Salbei";
       scope = 2;
       displayName = CSTRING(Displayname);
       //model = QPATHTOF(data\ace_gunbag.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       maximumLoad = 0;
       mass = 27.2155;
   };
   class Grad_APOBS_B:Grad_APOBS_F {
       //model = QPATHTOF(data\ace_gunbag.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       mass = 23.5868;
   };

   class Man;
   class CAManBase: Man {
       class ACE_Actions {
           class ACE_MainActions {
               class GVAR(openApobs) {
                   displayName = CSTRING(ToGunbag);
                   condition = QUOTE(([_target] call FUNC(hasGunbag)) && {[ARR_2(_player,_target)] call FUNC(canInteract) == 0});
                   statement = QUOTE([ARR_2(_player,_target)] call FUNC(toGunbag));
                   showDisabled = 0;
                   priority = 1;
                   icon = QPATHTOF(ui\gunbag_icon_ca.paa);
               };
               class GVAR(connectApobs) {
                   displayName = CSTRING(OffGunbag);
                   condition = QUOTE(([_target] call FUNC(hasGunbag)) && {[ARR_2(_player,_target)] call FUNC(canInteract) == 1});
                   statement = QUOTE([ARR_2(_player,_target)] call FUNC(offGunbag));
                   showDisabled = 0;
                   priority = 1;
                   icon = QPATHTOF(ui\gunbag_icon_ca.paa);
               };
               class GVAR(setUpRocket) {
                   displayName = CSTRING(Status);
                   condition = QUOTE([_target] call FUNC(hasGunbag));
                   statement = QUOTE([_target] call FUNC(status));
                   showDisabled = 0;
                   priority = 2;
                   icon = QPATHTOF(ui\gunbag_icon_ca.paa);
               };
           };
       };
   };
};
