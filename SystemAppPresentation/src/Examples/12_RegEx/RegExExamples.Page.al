page 54111 "MNB RegEx Examples"
{
    Caption = 'RegEx Examples';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group(Examples)
            {
                field(RegExTxtField; RegExTxt)
                {
                    ApplicationArea = All;
                    Caption = 'Regular Expression';
                    ToolTip = 'Specifies the value of the Regular Expression field.';
                }
                field(TextToLookField; TextToLook)
                {
                    Caption = 'Text';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Text field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Find)
            {
                ApplicationArea = All;
                Caption = 'Find in Text';
                ToolTip = 'Executes the ActionName action.';
                trigger OnAction()
                var
                    Regex: Codeunit Regex;
                    NoMatchErr: Label 'No Match for %1', Comment = '%1 - regular expression';
                    MatchMsg: Label 'There is a match for %1', Comment = '%1 - regular expression';
                begin
                    if not Regex.IsMatch(TextToLook, RegExTxt) then
                        Error(NoMatchErr, RegExTxt)
                    else
                        Message(MatchMsg, RegExTxt);
                end;
            }
        }
    }

    var
        RegExTxt: Text;
        TextToLook: Text;
}