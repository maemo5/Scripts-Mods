---------------------------------------------------------------------------------------------------------------------------

1.  INSERT THE TRADERS FOLDER INTO YOUR MISSION PBO, DELETING ANY MOD FOLDERS YOU DONT USE.

---------------------------------------------------------------------------------------------------------------------------

2.  IN CONFIG.CPP IN MISSION PBO: REPLACE FROM "class CfgExileArsenal" DOWN TO LINE ABOVE "class CfgExileCustomCode" with (CHOSING WHICH MODS YOU ARE USING AND DELETE OTHER LINES)

class CfgExileArsenal
{
    #include "TRADERS\APEX\ItemListAPEX.hpp"
    #include "TRADERS\ARMA3V\ItemListARMA3V.hpp"
    #include "TRADERS\ARMA3W\ItemListARMA3W.hpp"
    #include "TRADERS\BPOINT\ItemListBPOINT.hpp"
    #include "TRADERS\CUNITS\ItemListCUNITS.hpp"
    #include "TRADERS\CUPV\ItemListCUPV.hpp"
    #include "TRADERS\CUPW\ItemListCUPW.hpp"
    #include "TRADERS\CUSTOM\ItemListCUSTOM.hpp"
    #include "TRADERS\EBM\ItemListEBM.hpp"
    #include "TRADERS\Exile\ItemListExile.hpp"
    #include "TRADERS\FFAA\ItemListFFAA.hpp"
    #include "TRADERS\FHQ\ItemListFHQ.hpp"
    #include "TRADERS\FMP\ItemListFMP.hpp"
    #include "TRADERS\FOX\ItemListFOX.hpp"
    #include "TRADERS\HAP\ItemListHAP.hpp"
    #include "TRADERS\HAFM\ItemListHAFM.hpp"
    #include "TRADERS\HVP\ItemListHVP.hpp"
    #include "TRADERS\HWP\ItemListHWP.hpp"
    #include "TRADERS\Jonzie\ItemListJonzie.hpp"
    #include "TRADERS\JETS\ItemListJETS.hpp"
    #include "TRADERS\KA\ItemListKA.hpp"
    #include "TRADERS\MASV\ItemListMASV.hpp"
    #include "TRADERS\MASW\ItemListMASW.hpp"
    #include "TRADERS\MASWW2\ItemListWW2.hpp"
    #include "TRADERS\NIA\ItemListNIA.hpp"
    #include "TRADERS\NLD\ItemListNLD.hpp"
    #include "TRADERS\PODS\ItemListPODS.hpp"
    #include "TRADERS\POOK\ItemListPOOK.hpp"
    #include "TRADERS\R3FW\ItemListR3FW.hpp"
    #include "TRADERS\RHSGREF\ItemListGREF.hpp"
    #include "TRADERS\RHSSAF\ItemListRHSSAF.hpp"
    #include "TRADERS\RHSV\ItemListRHSV.hpp"
    #include "TRADERS\RHSW\ItemListRHSW.hpp"
    #include "TRADERS\TANKDLC\ItemListTANKDLC.hpp"
    #include "TRADERS\TRYK\ItemListTRYK.hpp"
    //#include "TRADERS\HLC\ItemListHLC.hpp"        //should use NIArms
};

---------------------------------------------------------------------------------------------------------------------------

3.  IN CONFIG.CPP IN MISSION PBO: REPLACE FROM "class CfgTraderCategories" DOWN TO LINE ABOVE "class CfgTraders" with (CHOSING WHICH MODS YOU ARE USING AND DELETE OTHER LINES)

'''
class CfgTraderCategories
{
    #include "TRADERS\APEX\TraderCategoriesAPEX.hpp"
    #include "TRADERS\ARMA3V\TraderCategoriesARMA3V.hpp"
    #include "TRADERS\ARMA3W\TraderCategoriesARMA3W.hpp"
    #include "TRADERS\BPOINT\TraderCategoriesBPOINT.hpp"
    #include "TRADERS\CUNITS\TraderCategoriesCUNITS.hpp"
    #include "TRADERS\CUPV\TraderCategoriesCUPV.hpp"
    #include "TRADERS\CUPW\TraderCategoriesCUPW.hpp"
    #include "TRADERS\CUSTOM\TraderCategoriesCUSTOM.hpp"
    #include "TRADERS\EBM\TraderCategoriesEBM.hpp"
    #include "TRADERS\Exile\TraderCategoriesExile.hpp"
    #include "TRADERS\FFAA\TraderCategoriesFFAA.hpp"
    #include "TRADERS\FHQ\TraderCategoriesFHQ.hpp"
    #include "TRADERS\FMP\TraderCategoriesFMP.hpp"
    #include "TRADERS\FOX\TraderCategoriesFOX.hpp"
    #include "TRADERS\HAP\TraderCategoriesHAP.hpp"
    #include "TRADERS\HAFM\TraderCategoriesHAFM.hpp"
    #include "TRADERS\HVP\TraderCategoriesHVP.hpp"
    #include "TRADERS\HWP\TraderCategoriesHWP.hpp"
    #include "TRADERS\Jonzie\TraderCategoriesJonzie.hpp"
    #include "TRADERS\JETS\TraderCategoriesJETS.hpp"
    #include "TRADERS\KA\TraderCategoriesKA.hpp"
    #include "TRADERS\MASV\TraderCategoriesMASV.hpp"
    #include "TRADERS\MASW\TraderCategoriesMASW.hpp"
    #include "TRADERS\MASWW2\TraderCategoriesWW2.hpp"
    #include "TRADERS\NIA\TraderCategoriesNIA.hpp"
    #include "TRADERS\NLD\TraderCategoriesNLD.hpp"
    #include "TRADERS\PODS\TraderCategoriesPODS.hpp"
    #include "TRADERS\POOK\TraderCategoriesPOOK.hpp"
    #include "TRADERS\R3FW\TraderCategoriesR3FW.hpp"
    #include "TRADERS\RHSGREF\TraderCategoriesGREF.hpp"
    #include "TRADERS\RHSSAF\TraderCategoriesRHSSAF.hpp"
    #include "TRADERS\RHSV\TraderCategoriesRHSV.hpp"
    #include "TRADERS\RHSW\TraderCategoriesRHSW.hpp"
    #include "TRADERS\TANKDLC\TraderCategoriesTANKDLC.hpp"
    #include "TRADERS\TRYK\TraderCategoriesTRYK.hpp"
    //#include "TRADERS\HLC\TraderCategoriesHLC.hpp"        //should use NIArms as that is newer and working version of HLC
};
'''

---------------------------------------------------------------------------------------------------------------------------

4.  IN CONFIG.CPP IN MISSION PBO: REPLACE FROM "class CfgTraders" DOWN TO LINE "class CfgTrading" with

class CfgTraders
{
    #include "TRADERS\CfgTraders.hpp"
};
You can alternatively copy the cfgtraders file content over the traders in the main config, not recommended.