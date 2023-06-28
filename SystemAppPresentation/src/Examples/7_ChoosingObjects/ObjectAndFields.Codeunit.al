codeunit 54106 "MNB Object and Fields"
{
    ///<summary>
    /// Shows how to choose objects
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Object%20Selection"/>
    /// </summary>
    procedure SelectObject(var Result: Record AllObjWithCaption): Boolean
    var
        AllObjects: Record AllObjWithCaption;
        Objects: Page Objects;
    begin
        AllObjects.FilterGroup(2);
        AllObjects.SetRange("Object Type", AllObjects."Object Type"::Table);
        AllObjects.FilterGroup(0);

        Objects.SetRecord(AllObjects);
        Objects.SetTableView(AllObjects);
        Objects.LookupMode := true;

        if Objects.RunModal = Action::LookupOK then begin
            Objects.GetRecord(Result);
            exit(true);
        end;

        exit(false);
    end;

    ///<summary>
    /// Shows how to choose fields
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Field%20Selection"/>
    /// </summary>

    procedure GetFieldCaption(var FieldCaption: Text)
    var
        SelectedField: Record Field;
        FieldSelection: Codeunit "Field Selection";
    begin
        SelectedField.FilterGroup(2);
        SelectedField.SetRange(TableNo, 27);
        SelectedField.FilterGroup(0);
        if FieldSelection.Open(SelectedField) then
            FieldCaption := SelectedField."Field Caption";
    end;
}