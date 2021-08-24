class cfgWeapons {
  class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GRAD_APOBS_rocketPacked: ACE_ItemCore {
        author = "Salbei";
        displayName = CSTRING(rocketPackedDescription);
        descriptionShort = CSTRING(rocketPackedDescription);
        //model = QPATHTOEF(assets,rocket_packed.p3d);
        //picture = QPATHTOF(ui\w_entrchtool_ca.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
};
