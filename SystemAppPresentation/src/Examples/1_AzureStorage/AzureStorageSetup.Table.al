table 54100 "MNB Azure Storage Setup"
{
    DataClassification = SystemMetadata;
    Caption = 'Azure Storage Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Container Name"; Text[250])
        {
            Caption = 'Container Name';
            DataClassification = SystemMetadata;
        }
        field(3; "Azure Account Name"; Text[250])
        {
            Caption = 'Azure Account Name';
            DataClassification = SystemMetadata;
        }
        field(4; "Storage Key"; Text[1024])
        {
            Caption = 'Storage Key';
            DataClassification = SystemMetadata;
            ExtendedDatatype = Masked;
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