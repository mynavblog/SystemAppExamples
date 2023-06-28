pageextension 54103 "MNB Company Information" extends "Company Information"
{
    actions
    {
        addlast("Application Settings")
        {
            action(MNBEnvironmentInfo)
            {
                ApplicationArea = All;
                Image = Info;
                Caption = 'Environment Info';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    MNBEnvironmentInfo: Codeunit "MNB Environment Info";
                begin
                    MNBEnvironmentInfo.GetInfo();
                end;
            }

        }
    }
}