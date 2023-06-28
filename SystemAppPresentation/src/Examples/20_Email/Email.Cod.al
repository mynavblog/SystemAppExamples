codeunit 54114 "MNB Email"
{
    /// <summary>
    /// The example how to open and send email from the customer card
    /// To test scenario you need to setup the email account in the system    
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Email"/>
    /// </summary>

    procedure OpenInEditor(var Customer: Record Customer)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubjectTxt: Label 'Please Pay!';
        EmailBodyTxt: Label 'Hi, Please pay your invoices!';
    begin
        EmailMessage.Create(Customer."E-Mail", EmailSubjectTxt, EmailBodyTxt, true);
        Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::"MNB My Email Scenario");
    end;

    procedure SendEmail(var Customer: Record Customer)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubjectTxt: Label 'Please Pay!';
        EmailBodyTxt: Label 'Hi, Please pay your invoices!';
    begin
        EmailMessage.Create(Customer."E-Mail", EmailSubjectTxt, EmailBodyTxt, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::"MNB My Email Scenario");
    end;
}