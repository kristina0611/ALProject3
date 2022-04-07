page 50600 "BC Country/Region Setup"
{
    Caption = 'Country/Region Setup';
    PageType = Card;
    SourceTable = "BC Country/Region Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(CountryRegion; Rec."Country/Region Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Select Country/Region for your Localization';
                }
                field(Name; Rec."Country/Region Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Shows selected country/region name';

                }
                field("Country/Region Enum"; Rec."Country/Region Enum")
                {
                    Visible = true;
                    ApplicationArea = All;
                    ToolTip = 'Select selected country/region';
                }
                action(UpgradeScript)
                {
                    ApplicationArea = All;
                    ToolTip= 'Run upgrade';
                    
                    trigger OnAction()
                    begin
                        
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not Rec.FindFirst() then begin

            Rec.Init();
            Rec.Insert();
        end;
    end;
}
