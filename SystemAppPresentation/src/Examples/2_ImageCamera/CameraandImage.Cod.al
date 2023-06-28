codeunit 54101 "MNB Camera and Image"
{
    /// <summary>
    /// The example how to take photo from the camera in few lines of code
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Camera%20and%20Media%20Interaction"/>
    /// </summary>

    internal procedure TakePurchaseInvoicePhoto(var PurchaseHeader: Record "Purchase Header")
    var
        Camera: Codeunit Camera;
        PictureInStream: InStream;
        CameraIsNotAvailableErr: Label 'Camera is not available.';
        NoPhotoTakenErr: Label 'No Photo Taken';
        PictureText: Text;
    begin
        if not Camera.IsAvailable() then
            Error(CameraIsNotAvailableErr);

        if not Camera.GetPicture(PictureInStream, PictureText) then
            Error(NoPhotoTakenErr);

        SavePicture(PurchaseHeader, PictureInStream, PictureText);
    end;

    internal procedure GetPictureSizeAndTransform(var PurchaseHeader: Record "Purchase Header")
    var
        Camera: Codeunit Camera;
        Image: Codeunit Image;
        PictureInStream: InStream;
        CameraIsNotAvailableErr: Label 'Camera is not available.';
        NoPhotoTakenErr: Label 'No Photo Taken';
        PictureSizeMsg: Label 'Picture Size: \ Height: %1\ Width: %2.';
        PictureText: Text;
    begin
        if not Camera.IsAvailable() then
            Error(CameraIsNotAvailableErr);

        if not Camera.GetPicture(PictureInStream, PictureText) then
            Error(NoPhotoTakenErr);

        TransformImage(Image, PictureInStream);

        GetTransformedFile(Image, PurchaseHeader);

        Message(PictureSizeMsg, Image.GetHeight(), Image.GetWidth());

    end;

    local procedure SavePicture(var PurchaseHeader: Record "Purchase Header"; var PictureInStream: InStream; var PictureText: Text)
    var
        MimeTypeTok: Label 'image/jpeg', Locked = true;
    begin
        Clear(PurchaseHeader."MNB Invoice Picture");
        PurchaseHeader."MNB Invoice Picture".ImportStream(PictureInStream, PictureText, MimeTypeTok);
        PurchaseHeader.Modify(true);
    end;

    local procedure GetTransformedFile(var Image: Codeunit Image; var PurchaseHeader: Record "Purchase Header")
    var
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        MimeTypeTok: Label 'image/jpeg', Locked = true;
        PictureTxt: Label 'picture_name.jpg';
        PictureOutStream: OutStream;
    begin
        TempBlob.CreateOutStream(PictureOutStream);
        Image.Save(PictureOutStream);
        TempBlob.CreateInStream(InStream);
        Clear(PurchaseHeader."MNB Invoice Picture");
        PurchaseHeader."MNB Invoice Picture".ImportStream(InStream, PictureTxt, MimeTypeTok);
        PurchaseHeader.Modify(true);
    end;

    local procedure TransformImage(var Image: Codeunit Image; var PictureInStream: InStream)
    begin
        Image.FromStream(PictureInStream);
        Image.RotateFlip(Enum::"Rotate Flip Type"::Rotate90FlipNone);
        Image.Crop(0, 0, Image.GetWidth() - 100, Image.GetHeight() - 100);
    end;

    procedure Example()
    var
        Image: Codeunit Image;
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;
        FileName: Text;
    begin
        UploadIntoStream('', '', '', FileName, InStream);

        Image.FromStream(InStream);
        Image.SetFormat(Enum::"Image Format"::Png);

        TempBlob.CreateOutStream(OutStream);
        Image.Save(OutStream);

        TempBlob.CreateInStream(InStream);
        FileName := FileName + '.png';
        DownloadFromStream(InStream, '', '', '', FileName);
    end;

}