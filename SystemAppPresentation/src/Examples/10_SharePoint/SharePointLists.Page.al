page 54108 "MNB SharePoint Folders"
{
    PageType = List;
    UsageCategory = None;
    SourceTable = "SharePoint Folder";
    SourceTableTemporary = true;
    Editable = false;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Folders)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Item Count"; Rec."Item Count")
                {
                    ToolTip = 'Specifies the value of the Item Count field.';
                }
            }
        }

    }
    procedure SetData(var SharePointFolder: Record "SharePoint Folder" temporary)
    begin
        Rec.Copy(SharePointFolder, true);
    end;
}