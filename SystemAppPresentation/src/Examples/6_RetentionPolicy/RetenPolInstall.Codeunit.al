codeunit 54105 "MNB Reten. Pol. Install"
{
    ///<summary>
    /// Shows how to add tables to retention policy allowed tables
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Retention%20Policy"/>
    /// </summary>
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        RetenPolAllowedTables: Codeunit "Reten. Pol. Allowed Tables";
    begin
        RetenPolAllowedTables.AddAllowedTable(Database::"MNB My Log Table")
    end;
}