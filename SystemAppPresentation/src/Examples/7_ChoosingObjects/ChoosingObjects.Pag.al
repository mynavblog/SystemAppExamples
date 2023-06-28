page 54105 "MNB Choosing Objects"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'MNB Choosing Objects';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Object';
                field(ObjectNameField; ObjectName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the object name. Choose the object from assist edit.';
                    Editable = false;
                    Caption = 'Object Name';
                    trigger OnAssistEdit()
                    var
                        AllObjWithCaption: Record AllObjWithCaption;
                        ObjectAndFields: Codeunit "MNB Object and Fields";
                    begin
                        if ObjectAndFields.SelectObject(AllObjWithCaption) then
                            ObjectName := AllObjWithCaption."Object Name";
                    end;
                }
                field(FieldNameField; FieldName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the field name. Choose the field from table Items from assist edit.';
                    Editable = false;
                    Caption = 'Field Name';
                    trigger OnAssistEdit()
                    var
                        ObjectAndFields: Codeunit "MNB Object and Fields";
                    begin
                        ObjectAndFields.GetFieldCaption(FieldName);
                    end;
                }
            }
        }
    }

    var
        FieldName, ObjectName : Text;


}