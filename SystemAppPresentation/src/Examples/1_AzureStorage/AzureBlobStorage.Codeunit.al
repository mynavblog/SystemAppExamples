codeunit 54103 "MNB Azure Blob Storage"
{
    /// <summary>
    /// The examples in this codeunit shows how to use Azure Blob Storage to get containers and files
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Azure%20Blob%20Services%20API"/>
    /// </summary>

    /// <summary>
    /// List all containers in the Azure Storage
    /// </summary>
    procedure ListContainers(): Text
    var
        ABSContainer: Record "ABS Container";
        ABSContainerClient: Codeunit "ABS Container Client";
        StorageServiceAuthorization: Codeunit "Storage Service Authorization";
        Authorization: Interface "Storage Service Authorization";
    begin
        MNBAzureStorageSetup.Get();
        Authorization := StorageServiceAuthorization.CreateSharedKey(MNBAzureStorageSetup."Storage Key");

        ABSContainerClient.Initialize(MNBAzureStorageSetup."Azure Account Name", Authorization);
        ABSContainerClient.ListContainers(ABSContainer);
        if Page.RunModal(Page::"MNB Azure Containers", ABSContainer) = Action::LookupOK then
            exit(ABSContainer.Name);
    end;

    /// <summary>
    /// List all files in the storage and download one
    /// </summary>
    procedure DownloadContainerFile(): Text
    var
        ABSContainerContent: Record "ABS Container Content";
        ABSBlobClient: Codeunit "ABS Blob Client";
        StorageServiceAuthorization: Codeunit "Storage Service Authorization";
        Authorization: Interface "Storage Service Authorization";
    begin
        MNBAzureStorageSetup.Get();
        Authorization := StorageServiceAuthorization.CreateSharedKey(MNBAzureStorageSetup."Storage Key");
        ABSBlobClient.Initialize(MNBAzureStorageSetup."Azure Account Name", MNBAzureStorageSetup."Container Name", Authorization);
        ABSBlobClient.ListBlobs(ABSContainerContent);
        if Page.RunModal(Page::"MNB Container Content", ABSContainerContent) = Action::LookupOK then
            ABSBlobClient.GetBlobAsFile(ABSContainerContent."Name")
    end;

    var
        MNBAzureStorageSetup: Record "MNB Azure Storage Setup";
}