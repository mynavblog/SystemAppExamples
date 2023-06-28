codeunit 54108 "MNB SharePoint Mgt."
{
    internal procedure ShowFolders(): Text;
    var
        MNBSharePointSetup: Record "MNB SharePoint Setup";
        SharePointFolder: Record "SharePoint Folder" temporary;
        SharePointClient: Codeunit "SharePoint Client";
        MNBSharePointFolders: Page "MNB SharePoint Folders";
        AadTenantId, ServerRelativeUrl : Text;
    begin
        MNBSharePointSetup.Get();
        AadTenantId := GetAadTenantNameFromBaseUrl(MNBSharePointSetup."Base URL");
        SharePointClient.Initialize(MNBSharePointSetup."Base URL", GetSharePointAuthorization(AadTenantId));
        SharePointClient.GetSubFoldersByServerRelativeUrl(ServerRelativeUrl, SharePointFolder);

        MNBSharePointFolders.SetData(SharePointFolder);
        MNBSharePointFolders.LookupMode(true);
        if MNBSharePointFolders.RunModal() = Action::LookupOK then begin
            MNBSharePointFolders.GetRecord(SharePointFolder);
            exit(SharePointFolder.Name);
        end;
    end;

    internal procedure UploadFile()
    var
        MNBSharePointSetup: Record "MNB SharePoint Setup";
        SharePointFile: Record "SharePoint File";
        FileManagement: Codeunit "File Management";
        SharePointClient: Codeunit "SharePoint Client";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        HttpDiagnostics: Interface "HTTP Diagnostics";
        SaveFailedErr: Label 'Save to SharePoint failed.\ErrorMessage: %1\HttpRetryAfter: %2\HttpStatusCode: %3\ResponseReasonPhrase: %4', Comment = '%1=GetErrorMessage; %2=GetHttpRetryAfter; %3=GetHttpStatusCode; %4=GetResponseReasonPhrase';
        AadTenantId: Text;
        FileName: Text;
    begin
        MNBSharePointSetup.Get();
        FileName := FileManagement.BLOBImportWithFilter(TempBlob, 'Import File', 'Import File', 'All Files (*.*)|*.*', '*.*');
        AadTenantId := GetAadTenantNameFromBaseUrl(MNBSharePointSetup."Base URL");
        SharePointClient.Initialize(MNBSharePointSetup."Base URL", GetSharePointAuthorization(AadTenantId));
        InStream := TempBlob.CreateInStream();
        if not SharePointClient.AddFileToFolder(MNBSharePointSetup."Folder Name", FileName, InStream, SharePointFile) then begin
            HttpDiagnostics := SharePointClient.GetDiagnostics();
            Error(SaveFailedErr, HttpDiagnostics.GetErrorMessage(), HttpDiagnostics.GetHttpRetryAfter(), HttpDiagnostics.GetHttpStatusCode(), HttpDiagnostics.GetResponseReasonPhrase());
        end;
    end;

    internal procedure ListFiles()
    var
        MNBSharePointSetup: Record "MNB SharePoint Setup";
        SharePointFile: Record "SharePoint File";
        SharePointClient: Codeunit "SharePoint Client";
        MNBSharePointFiles: Page "MNB SharePoint Files";
        AadTenantId: Text;
    begin
        MNBSharePointSetup.Get();
        AadTenantId := GetAadTenantNameFromBaseUrl(MNBSharePointSetup."Base URL");
        SharePointClient.Initialize(MNBSharePointSetup."Base URL", GetSharePointAuthorization(AadTenantId));
        SharePointClient.GetFolderFilesByServerRelativeUrl(MNBSharePointSetup."Folder Name", SharePointFile);
        MNBSharePointFiles.SetData(SharePointFile);
        MNBSharePointFiles.LookupMode(true);
        MNBSharePointFiles.RunModal();
    end;

    local procedure GetSharePointAuthorization(AadTenantId: Text): Interface "SharePoint Authorization"
    var
        MNBSharePointSetup: Record "MNB SharePoint Setup";
        SharePointAuth: Codeunit "SharePoint Auth.";
        Scopes: List of [Text];
    begin
        MNBSharePointSetup.Get();
        Scopes.Add('00000003-0000-0ff1-ce00-000000000000/.default');
        exit(SharePointAuth.CreateAuthorizationCode(AadTenantId, MNBSharePointSetup."Client Id", MNBSharePointSetup."Client Secret", Scopes));
    end;

    local procedure GetAadTenantNameFromBaseUrl(BaseUrl: Text): Text
    var
        Uri: Codeunit Uri;
        MySiteHostSuffixTxt: Label '-my.sharepoint.com', Locked = true;
        OnMicrosoftTxt: Label '.onmicrosoft.com', Locked = true;
        SharePointHostSuffixTxt: Label '.sharepoint.com', Locked = true;
        UrlInvalidErr: Label 'The Base Url %1 does not seem to be a valid SharePoint Online Url.', Comment = '%1=BaseUrl';
        Host: Text;
    begin
        // SharePoint Online format:  https://tenantname.sharepoint.com/SiteName/LibraryName/
        // SharePoint My Site format: https://tenantname-my.sharepoint.com/personal/user_name/
        Uri.Init(BaseUrl);
        Host := Uri.GetHost();
        if not Host.EndsWith(SharePointHostSuffixTxt) then
            Error(UrlInvalidErr, BaseUrl);
        if Host.EndsWith(MySiteHostSuffixTxt) then
            exit(CopyStr(Host, 1, StrPos(Host, MySiteHostSuffixTxt) - 1) + OnMicrosoftTxt);
        exit(CopyStr(Host, 1, StrPos(Host, SharePointHostSuffixTxt) - 1) + OnMicrosoftTxt);
    end;

}