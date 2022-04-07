codeunit 50600 "BC Marija"
{
    TableNo = Customer;

    trigger OnRun()
    begin
        Rec.FindFirst();
        Message('Hello: %1', Rec.Count);
    end;

    procedure Mladjan()
    begin
        Message('Greetings from Trinidad');
    end;

    procedure setKristina(k: Integer)
    var
    begin
        Kristina := k;
    end;

    procedure getKristina(): Integer;
    begin
        exit(Kristina);
    end;

    var
        Kristina: Integer;
}