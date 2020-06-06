class CBA_Extended_EventHandlers;

class CfgVehicles {

  class Bag_Base;
  class Grad_APOBS_Frontpack: Bag_Base {
       author = "DerZade [A] & Salbei";
       scope = 2;
       displayName = "APOBS Frontpack";
       model = QPATHTOF(data\models\backpackWithStraps.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       maximumLoad = 0;
       mass = 27.2155;
   };
   class Grad_APOBS_Rearpack: Grad_APOBS_Frontpack {
       displayName = "APOBS Rearpack";
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
   };

  class ThingX;
  /*
  class grad_apobs_cover: ThingX
  {
    author="DerZade";
    displayName="APOBS Cover";
    scope=1;
    model = QPATHTOF(data\models\cover.p3d);
    //picture = QPATHTOF(ui\gunbag_ca.paa);
    //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
    //hiddenSelections[] = {"Camo"};
    //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};

  };
  class grad_apobs_base: grad_apobs_cover
  {
    displayName="APOBS Base";
    model = QPATHTOF(data\models\base.p3d);
  };
  */

   class Grad_APOBS_Frontpack_closed: ThingX {
        author = "DerZade [A] & Salbei";
        scope = 1;
        displayName = "APOBS Frontpack";
        model = QPATHTOF(data\models\backpack.p3d);
        //picture = QPATHTOF(ui\gunbag_ca.paa);
        //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
        //hiddenSelections[] = {"Camo"};
        //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
        mass = 27.2155;
        class AnimationSources
        {
            class apobs_open
            {
                source = "user";	// The controller is defined as a user animation.
                animPeriod = 1;		// The animation period used for this controller.
                initPhase=0;		// Initial phase when object is created.
            };
        };
   };
   class Grad_APOBS_Rearpack_closed: ThingX {
       author = "DerZade [A] & Salbei";
       scope = 1;
       displayName = "APOBS Rearpack";
       model = QPATHTOF(data\models\backpack.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       mass = 27.2155;
   };
   class Grad_APOBS_Connector: ThingX {
       author = "DerZade [A] & Salbei";
       scope = 1;
       displayName = "APOBS Connector";
       model = QPATHTOF(data\models\connector.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       mass = 1;
   };
   class Grad_APOBS_Rocket: ThingX {
       author = "DerZade [A] & Salbei";
       scope = 1;
       displayName = "APOBS Rocket";
       model = QPATHTOF(data\models\rocket.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       mass = 1;
      };
   class Grad_APOBS_Parachute: ThingX {
       author = "DerZade [A] & Salbei";
       scope = 1;
       displayName = "APOBS Parachute";
       model = QPATHTOF(data\models\parachute.p3d);
       //model = QPATHTOF(data\models\backpack.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       mass = 1;
   };
};
