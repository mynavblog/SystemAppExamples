page 54109 "MNB SharePoint Files"
{
    PageType = List;
    UsageCategory = None;
    SourceTable = "SharePoint File";
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
                field("Server Relative Url"; Rec."Server Relative Url")
                {
                    ToolTip = 'Specifies the value of the Server Relative Url field.';
                }
            }

        }
    }

    procedure SetData(var SharePointFile: Record "SharePoint File" temporary)
    begin
        Rec.Copy(SharePointFile, true);
    end;
}