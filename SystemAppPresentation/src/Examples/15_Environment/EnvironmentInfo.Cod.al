codeunit 54110 "MNB Environment Info"
{
    procedure GetInfo()
    var
        EnvironmentInformation: Codeunit "Environment Information";
        TenantInformation: Codeunit "Tenant Information";
        InfoAboutEnvTxt: Label 'This is the information about the environment: \\ Is it Sandbox: %1 \\ Is it Production: %2 \\ Is it SaaS: %3 \\ Environment Name: %4';
        InfoAboutTenantTxt: Label 'This is the information about the tenant: \\ Tenant ID: %1 \\ Tenant Display Name: %2';
    begin
        Message(InfoAboutEnvTxt,
            EnvironmentInformation.IsSandbox(),
            EnvironmentInformation.IsProduction(),
            EnvironmentInformation.IsSaaS(),
            EnvironmentInformation.GetEnvironmentName());

        Message(InfoAboutTenantTxt,
            TenantInformation.GetTenantID(),
            TenantInformation.GetTenantDisplayName());
    end;
}