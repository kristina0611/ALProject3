codeunit 50601 "BC MySubscribes"
{
    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnCallPublisher', '', true, true)]
    local procedure MessageOnCallPublisher(var Customer: Record Customer)
    var
        TextMsg: Label 'You have succeeded %1', Comment = '%1: Customer Name';
    begin
        Message(TextMsg, Customer.Name);
    end;

}