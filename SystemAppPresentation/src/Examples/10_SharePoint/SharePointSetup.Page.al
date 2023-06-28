page 54107 "MNB SharePoint Setup"
{
    Caption = 'SharePoint Setup';
    PageType = Card;
    SourceTable = "MNB SharePoint Setup";
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
                field("Client Id"; Rec."Client Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Client Id field.';
                }
                field("Client Secret"; Rec."Client Secret")
                {
                    ToolTip = 'Specifies the value of the Client Secret field.';
                    ApplicationArea = All;

                }
                field("Base URL"; Rec."Base URL")
                {
                    ToolTip = 'Specifies the value of the Base URL field.';
                    ApplicationArea = All;
                }
                field("Folder Name"; Rec."Folder Name")
                {
                    ToolTip = 'Specifies the value of the Folder Name field.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(UploadFile)
            {
                Caption = 'Upload File to SharePoint';
                Image = ShowList;
                ToolTip = 'Upload File to SharePoint';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    MNBSharePointMgt: Codeunit "MNB SharePoint Mgt.";
                begin
                    MNBSharePointMgt.UploadFile();
                end;
            }
            action(ListFolders)
            {
                Caption = 'List Folders';
                Image = ShowList;
                ToolTip = 'Show list of folders';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    MNBSharePointMgt: Codeunit "MNB SharePoint Mgt.";
                begin
                    Rec."Folder Name" := MNBSharePointMgt.ShowFolders();
                end;
            }
            action(ListFiles)
            {
                Caption = 'List Files';
                Image = FileContract;
                ToolTip = 'Show list of files in the SharePoint.';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    MNBSharePointMgt: Codeunit "MNB SharePoint Mgt.";
                begin
                    MNBSharePointMgt.ListFiles();
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
