page 54103 "MNB Container Content"
{
    Caption = 'MNB Container Content';
    PageType = List;
    SourceTable = "ABS Container Content";
    UsageCategory = None;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }

                field("Content Type"; Rec."Content Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Content-Type field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
            }
        }
    }
}
