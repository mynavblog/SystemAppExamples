tableextension 54101 "MNB Customer" extends Customer
{
    fields
    {
        field(54100; "MNB Responsible User"; Code[50])
        {
            DataClassification = EndUserPseudonymousIdentifiers;
            Caption = 'Responsible User';

            trigger OnValidate()
            var
                UserSelection: Codeunit "User Selection";
            begin
                UserSelection.ValidateUserName(Rec."MNB Responsible User");
            end;

            trigger OnLookup()
            var
                User: Record User;
                UserSelection: Codeunit "User Selection";
            begin
                UserSelection.FilterSystemUserAndGroupUsers(User);
                UserSelection.Open(User);
                Rec."MNB Responsible User" := User."User Name";
            end;
        }
    }

}