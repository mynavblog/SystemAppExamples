page 54110 "MNB Password Operations"
{
    ///<summary>
    /// Shows example of math module
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Math"/>
    /// </summary>

    Caption = 'Password Operations';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(PasswordText; Password)
                {
                    Editable = false;
                    Caption = 'My Password';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {

            action(TypePassword)
            {
                Caption = 'Type Password';
                ToolTip = 'Type password for the user.';
                Image = Absence;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    PasswordDialogManagement: Codeunit "Password Dialog Management";
                    PasswordToCheck: Text;
                    MyPasswordTxt: Label 'My Top Secret Password does not match.';
                begin
                    PasswordToCheck := PasswordDialogManagement.OpenPasswordDialog();
                    if PasswordToCheck <> Password then
                        Error(MyPasswordTxt, Password);
                end;
            }
            action(ChangePassword)
            {
                Caption = 'Change Password';
                ToolTip = 'Set password for the user.';
                Image = Absence;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    NewPassword: Text;
                    PasswordDialogManagement: Codeunit "Password Dialog Management";
                begin
                    PasswordDialogManagement.OpenChangePasswordDialog(Password, NewPassword);
                    Password := NewPassword;
                end;
            }
        }
    }
    var
        Password: Text;
}
