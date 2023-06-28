page 54114 "MNB Persistent Blob"
{
    Caption = 'MNB Persistent Blob';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Persistent Blob';
                field(BlobIntegerField; BlobInteger)
                {
                    ApplicationArea = All;
                    Caption = 'Blob Integer Field';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportBlob)
            {
                ApplicationArea = All;
                Caption = 'Import Blob';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                trigger OnAction()
                var
                    MNBPersistentBlob: Codeunit "MNB Persistent Blob";
                begin
                    BlobInteger := MNBPersistentBlob.SaveBlobToPersistedBlob()
                end;
            }
            action(ExportBlob)
            {
                ApplicationArea = All;
                Caption = 'Export Blob';
                Promoted = true;
                PromotedCategory = Process;
                Image = Export;
                trigger OnAction()
                var
                    MNBPersistentBlob: Codeunit "MNB Persistent Blob";
                begin
                    MNBPersistentBlob.DownloadBlobFromPersistedBlob(BlobInteger);
                end;
            }

            action(DeleteBlob)
            {
                ApplicationArea = All;
                Caption = 'Delete Blob';
                Promoted = true;
                PromotedCategory = Process;
                Image = Delete;
                trigger OnAction()
                var
                    MNBPersistentBlob: Codeunit "MNB Persistent Blob";
                begin
                    MNBPersistentBlob.DeleteBlobFromPersistedBlob(BlobInteger);
                end;
            }

        }
    }
    var
        BlobInteger: BigInteger;
}