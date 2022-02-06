class cfgWeapons {
  class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GRAD_APOBS_rocketPacked: ACE_ItemCore {
        author = "Salbei";
        displayName = CSTRING(rocketPacked);
        descriptionShort = CSTRING(rocketPackedDescription);
        picture = QPATHTOF(data\rocketholder_bag.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
};
