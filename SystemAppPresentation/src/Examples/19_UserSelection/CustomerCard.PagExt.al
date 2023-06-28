pageextension 54105 "MNB Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("MNB Responsible User"; Rec."MNB Responsible User")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Responsible User for the customer.';
            }
        }
    }
    actions
    {
        addlast("&Customer")
        {
            action(MNBEmailEditor)
            {
                ApplicationArea = All;
                Caption = 'Email Editor';
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Open email editor for the customer.';

                trigger OnAction()
                var
                    MNBEmail: Codeunit "MNB Email";
                begin
                    MNBEmail.OpenInEditor(Rec);
                end;
            }
            action(MNBEmailSend)
            {
                ApplicationArea = All;
                Caption = 'Email Send';
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Send email for the customer.';

                trigger OnAction()
                var
                    MNBEmail: Codeunit "MNB Email";
                begin
                    MNBEmail.SendEmail(Rec);
                end;
            }
        }
    }
}