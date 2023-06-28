codeunit 54104 "MNB Checklist Install"
{
    /// <summary>
    /// The examples in this codeunit show how to create Assisted Setup and Guided Experience (for example links to blog posts) 
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Guided%20Experience"/>
    /// </summary>
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    begin
        CreateManualSetups();
        CreateVideoLinks();
    end;

    ///<summary>
    /// Create manual setups that can be later use in the checklists and are visible in the manual setups
    /// </summary>

    local procedure CreateManualSetups()
    var
        GuidedExperience: Codeunit "Guided Experience";
    begin
        GuidedExperience.InsertManualSetup(AzureStorageTitleLbl, AzureStorageShortTitleLbl, AzureStorageDescriptionLbl, 2, ObjectType::Page, Page::"MNB Azure Storage Setup", Enum::"Manual Setup Category"::General, 'Demo');
        GuidedExperience.InsertManualSetup(ImageAndCameraTitleLbl, ImageAndCameraShortTitleLbl, ImageAndCameraDescriptionLbl, 4, ObjectType::Page, Page::"Purchase Orders", Enum::"Manual Setup Category"::General, 'Demo');
        GuidedExperience.InsertManualSetup(GeolocationTitleLbl, GeolocationShortTitleLbl, GeolocationDescriptionLbl, 4, ObjectType::Page, Page::"Fixed Asset List", Enum::"Manual Setup Category"::General, 'Demo');
        GuidedExperience.InsertManualSetup(BarcodeTitleLbl, BarcodeShortTitleLbl, BarcodeDescriptionLbl, 4, ObjectType::Report, Report::"MNB Item Barcode", Enum::"Manual Setup Category"::General, 'Demo');
        GuidedExperience.InsertManualSetup(FilterTokensTitleLbl, FilterTokensShortTitleLbl, FilterTokensDescriptionLbl, 4, ObjectType::Page, Page::"Sales Order List", Enum::"Manual Setup Category"::General, 'Demo');
        GuidedExperience.InsertManualSetup(ObjectsTitleLbl, ObjectsShortTitleLbl, ObjectsDescriptionLbl, 4, ObjectType::Page, Page::"MNB Choosing Objects", Enum::"Manual Setup Category"::General, 'Demo');
        GuidedExperience.InsertManualSetup(RecurrenceTitleLbl, RecurrenceShortTitleLbl, RecurrenceDescriptionLbl, 4, ObjectType::Page, Page::"MNB Next Occurrence", Enum::"Manual Setup Category"::General, 'Demo');
    end;

    local procedure CreateVideoLinks()
    var
        GuidedExperience: Codeunit "Guided Experience";
    begin
        GuidedExperience.InsertVideo('Special Guest', 'Special Guest', '', 1, 'https://www.youtube.com/embed/btPJPFnesV4', Enum::"Video Category"::DoMoreWithBC);
    end;



    var
        AzureStorageDescriptionLbl: Label 'Integration with Azure Blob storage and how to use it to import the files.';
        AzureStorageShortTitleLbl: Label 'Azure Storage';
        AzureStorageTitleLbl: Label 'Azure Blob Storage Example';
        BarcodeDescriptionLbl: Label 'Print 1d and 2d barcode in the reports.';
        BarcodeShortTitleLbl: Label 'Barcode Printouts';
        BarcodeTitleLbl: Label 'Barcode Printouts Example';
        FilterTokensDescriptionLbl: Label 'Filter tokens allow to easier filter the data with predefine tokens.';
        FilterTokensShortTitleLbl: Label 'Filter Tokens';
        FilterTokensTitleLbl: Label 'Filter Tokens Example';
        GeolocationDescriptionLbl: Label 'Get GPS coordinates for the client.';
        GeolocationShortTitleLbl: Label 'Geolocation';
        GeolocationTitleLbl: Label 'Geolocation Example';
        ImageAndCameraDescriptionLbl: Label 'Get pictures and process the images without additional code';
        ImageAndCameraShortTitleLbl: Label 'Camera and Image';
        ImageAndCameraTitleLbl: Label 'Camera and Image Example';
        ObjectsDescriptionLbl: Label 'In SystemApp there are functions allowing to choose fields and objects.';
        ObjectsShortTitleLbl: Label 'Choose Objects and Fields';
        ObjectsTitleLbl: Label 'Choose Objects and Fields Example';
        RecurrenceDescriptionLbl: Label 'Example shows how to get the next occurrence of date for specific schedule.';
        RecurrenceShortTitleLbl: Label 'Recurrence Schedule';
        RecurrenceTitleLbl: Label 'Recurrence Schedule Example';
}