codeunit 50603 "BC Country/Region Upgrade"
{
    //Subtype = Upgrade;

    trigger OnRun()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(ReasonLbl) then exit;

        PerformUpgrade();

        UpgradeTag.SetUpgradeTag(ReasonLbl);
    end;

    local procedure PerformUpgrade()
    var
        CountryRegionSetup: Record "BC Country/Region Setup";
        CountryRegionInstall: Codeunit "BC Code/Region Install";

    begin
        if not CountryRegionSetup.FindFirst() then
            CountryRegionSetup.Init();
        CountryRegionSetup."Country/Region Code" := 'ME';
        if not CountryRegionSetup.Insert() then
            CountryRegionSetup.Modify();
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure ;
    var
    begin
        PerCompanyUpgradeTags.Add(ReasonLbl);
    end;


    var
        ReasonLbl: Label 'BeTerna-SetupEnum-20220406', Locked = true;
}