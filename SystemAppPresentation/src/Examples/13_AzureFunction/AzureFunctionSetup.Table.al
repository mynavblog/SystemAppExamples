table 54103 "MNB Azure Function Setup"
{
    DataClassification = SystemMetadata;
    Caption = 'Azure Function Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Azure Function Url"; Text[250])
        {
            Caption = 'Azure Function Url';
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