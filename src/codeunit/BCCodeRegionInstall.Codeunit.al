codeunit 50602 "BC Code/Region Install"
{

    Subtype = Install;



    trigger OnInstallAppPerCompany();

    var

        UpgradeTag: Codeunit "Upgrade Tag";

        myAppInfo: ModuleInfo;

    begin

        NavApp.GetCurrentModuleInfo(myAppInfo);



        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall()

        else
            HandleReinstall();



        UpgradeTag.SetAllUpgradeTags();

    end;



    local procedure HandleFreshInstall();

    var

        CountryRegionSetup: Record "BC Country/Region Setup";

    begin

        CountryRegionSetup.Init();

        CountryRegionSetup."Country/Region Code" := 'RS';

        if not CountryRegionSetup.Insert() then;

    end;



    local procedure HandleReinstall();

    var

        CountryRegionSetup: Record "BC Country/Region Setup";

    begin

        CountryRegionSetup.Init();

        CountryRegionSetup."Country/Region Code" := 'ME';

        if not CountryRegionSetup.Insert() then;

    end;

    //mojaizmena
    //drugaizmena
    //trecaizmena
    //Dodali smo nesto

}
