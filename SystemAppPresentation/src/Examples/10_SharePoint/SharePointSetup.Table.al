table 54102 "MNB SharePoint Setup"
{
    DataClassification = SystemMetadata;
    Caption = 'SharePoint Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Client Id"; Text[250])
        {
            Caption = 'Client Id';
            DataClassification = SystemMetadata;
        }
        field(3; "Client Secret"; Text[1024])
        {
            Caption = 'Client Secret';
            DataClassification = SystemMetadata;
            ExtendedDatatype = Masked;
        }
        field(4; "Base URL"; Text[250])
        {
            Caption = 'Base URL';
            DataClassification = SystemMetadata;
        }
        field(5; "Folder Name"; Text[250])
        {
            Caption = 'Folder Name';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}