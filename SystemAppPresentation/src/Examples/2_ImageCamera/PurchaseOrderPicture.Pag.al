page 54100 "MNB Purchase Order Picture"
{
    Caption = 'MNB Purchase Order Picture';
    PageType = CardPart;
    SourceTable = "Purchase Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;
                field("MNB Invoice Picture"; Rec."MNB Invoice Picture")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the invoice picture for the purchase order';
                }
            }
        }
    }
}
