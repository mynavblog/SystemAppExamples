page 54102 "MNB Azure Storage Setup"
{
    Caption = 'MNB Azure Storage Setup';
    PageType = Card;
    SourceTable = "MNB Azure Storage Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Container Name"; Rec."Container Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Container Name field.';
                    Editable = false;
                }
                field("Azure Account Name"; Rec."Azure Account Name")
                {
                    ToolTip = 'Specifies the value of the Azure Account Name field.';
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Storage Key"; Rec."Storage Key")
                {
                    ToolTip = 'Specifies the value of the Storage Key field.';
                    ApplicationArea = All;
                    Importance = Additional;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ListContainers)
            {
                Caption = 'List Containers';
                Image = ShowList;
                ToolTip = 'Show list of containers';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    MNBAzureBlobStorage: Codeunit "MNB Azure Blob Storage";
                begin
                    Rec."Container Name" := MNBAzureBlobStorage.ListContainers();
                end;
            }
            action(ListFiles)
            {
                Caption = 'List Files';
                Image = FileContract;
                ToolTip = 'Show list of files in the container.';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    MNBAzureBlobStorage: Codeunit "MNB Azure Blob Storage";
                begin
                    MNBAzureBlobStorage.DownloadContainerFile();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
