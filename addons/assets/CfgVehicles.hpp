class CBA_Extended_EventHandlers;

class CfgVehicles {

  class Bag_Base;
  class Grad_APOBS_Frontpack: Bag_Base {
       author = "DerZade [A] & Salbei";
       scope = 2;
       displayName = "APOBS Frontpack";
       model = QPATHTOF(data\models\backpack.p3d);
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

  class Items_base_F;
  class grad_apobs_cover: Items_base_F
  {
    author="DerZade";
    displayName="APOBS Cover";
    scope=2;
    scopeCurator=2;
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


   class Grad_APOBS_Frontpack_closed: Items_base_F {
       author = "DerZade [A] & Salbei";
       scope = 1;
       displayName = "APOBS Frontpack";
       model = QPATHTOF(data\models\backpack.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       maximumLoad = 0;
       mass = 27.2155;
   };
   class Grad_APOBS_Rearpack_closed: Items_base_F {
       author = "DerZade [A] & Salbei";
       scope = 1;
       displayName = "APOBS Rearpack";
       model = QPATHTOF(data\models\backpack.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       maximumLoad = 0;
       mass = 27.2155;
   };
   /*
   class Grad_APOBS_Connector {
       author = "DerZade [A] & Salbei";
       scope = 1;
       displayName = "APOBS Connector";
       model = QPATHTOF(data\models\connector.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       mass = 1;
   };
   class Grad_APOBS_Rocket {
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
   };
   class GRAD_APOBS_Parachute {
       author = "DerZade [A] & Salbei";
       scope = 1;
       displayName = "APOBS Parachute";
       model = QPATHTOF(data\models\backpack.p3d);
       //picture = QPATHTOF(ui\gunbag_ca.paa);
       //icon = QPATHTOF(ui\gunbag_icon_ca.paa);
       //hiddenSelections[] = {"Camo"};
       //hiddenSelectionsTextures[] = {QPATHTOF(data\images\out_co.paa)};
       mass = 1;
   };
   */
};
