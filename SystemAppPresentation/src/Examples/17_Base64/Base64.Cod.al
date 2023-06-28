codeunit 54112 "MNB Base64"
{
    procedure DownloadFromBase64(var Base64Txt: Text)
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileName: Text;
        FileNameTxt: Label 'Picture.jpg';
        OutStream: OutStream;
        InStream: InStream;
    begin
        TempBlob.CreateOutStream(OutStream);
        Base64Convert.FromBase64(Base64Txt, OutStream);
        TempBlob.CreateInStream(InStream);
        FileName := FileNameTxt;
        DownloadFromStream(InStream, '', '', '', FileName);
    end;

    procedure PictureToBase64(): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        FileName, Base64Text : Text;
        InStream: InStream;
    begin
        UploadIntoStream('', '', '', FileName, InStream);
        Base64Text := Base64Convert.ToBase64(InStream);
        exit(Base64Text);
    end;
}