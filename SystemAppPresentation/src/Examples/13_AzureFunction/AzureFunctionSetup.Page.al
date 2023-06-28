page 54112 "MNB Azure Function Setup"
{
    Caption = 'Azure Function Setup';
    PageType = Card;
    SourceTable = "MNB Azure Function Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Azure Function Url"; Rec."Azure Function Url")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Azure Function URL field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(RunFunction)
            {
                Caption = 'Run Function';
                Image = Start;
                ToolTip = 'Run Azure Function';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    MNBAzureFunctionMgt: Codeunit "MNB Azure Function Mgt";
                begin
                    MNBAzureFunctionMgt.RunAzureFunction();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
