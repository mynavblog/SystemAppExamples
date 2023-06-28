codeunit 54102 "MNB Asset Location Mgt"
{
    /// <summary>
    /// The example how to get GPS coordinates
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Geolocation"/>
    /// </summary>
    internal procedure GetGeolocation(FixedAsset: Record "Fixed Asset")
    var
        Geolocation: Codeunit Geolocation;
        Latitude: Decimal;
        Longitude: Decimal;
        FixedAssetIsLocatedMsg: Label 'Fixed Asset %1 is located at: \ Latitude: %2 \ Longitude: %3', Comment = '%1 = FA description, %2 - Lat. value, %3 - Long. value';
    begin
        Geolocation.SetHighAccuracy(true);
        if Geolocation.RequestGeolocation() then
            Geolocation.GetGeolocation(Latitude, Longitude);
        Message(FixedAssetIsLocatedMsg, FixedAsset."Description", Latitude, Longitude);
    end;
}