codeunit 54100 "MNB Filter Tokens"
{
    /// <summary>
    /// The examples in this codeunit shows how to create Filter Tokens
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Filter%20Tokens"/>
    /// </summary>

    /// <summary>
    /// Add new Filter Tokens fro Date filters
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", 'OnResolveDateFilterToken', '', true, true)]
    local procedure RunOnResolveDateFilterToken(DateToken: Text; var FromDate: Date; var ToDate: Date; var Handled: Boolean)
    begin
        AddNextLastWeekFilterToken(DateToken, FromDate, ToDate, Handled);
    end;

    /// <summary>
    /// Example for Filter Token Text
    /// </summary>
    local procedure FilterTokensTextExamples()
    begin

    end;

    local procedure AddNextLastWeekFilterToken(DateToken: Text; var FromDate: Date; var ToDate: Date; var Handled: Boolean)
    var
        LastWeekLbl: Label 'LASTWEEK', Comment = 'Must be uppercase';
        NextWeekLbl: Label 'NEXTWEEK', Comment = 'Must be uppercase';
    begin
        case DateToken.ToUpper() of
            NextWeekLbl:
                begin
                    FromDate := Today;
                    ToDate := CalcDate('<7D>', Today);
                    Handled := true;
                end;
            LastWeekLbl:
                begin
                    FromDate := CalcDate('<-7D>', Today);
                    ToDate := Today;
                    Handled := true;
                end;
        end;
    end;


}
