codeunit 54115 "MNB Persistent Blob"
{
    procedure SaveBlobToPersistedBlob(): BigInteger
    var
        PersistentBlob: Codeunit "Persistent Blob";
        BlobInteger: BigInteger;
        InStream: InStream;
        FileName: Text;
    begin
        UploadIntoStream('', '', '', FileName, InStream);
        BlobInteger := PersistentBlob.Create();
        PersistentBlob.CopyFromInStream(BlobInteger, InStream);
        exit(BlobInteger);
    end;

    procedure DownloadBlobFromPersistedBlob(BlobInteger: BigInteger)
    var
        PersistentBlob: Codeunit "Persistent Blob";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        BlobDoesNotExistErr: Label 'Blob does not exist';
        FileNameTxt: Label 'ExportedFile.txt';
        OutStream: OutStream;
        FileName: Text;

    begin
        if not PersistentBlob.Exists(BlobInteger) then
            Error(BlobDoesNotExistErr);
        TempBlob.CreateOutStream(OutStream);
        PersistentBlob.CopyToOutStream(BlobInteger, OutStream);
        TempBlob.CreateInStream(InStream);
        FileName := FileNameTxt;
        DownloadFromStream(InStream, '', '', '', FileName);
    end;

    procedure DeleteBlobFromPersistedBlob(BlobInteger: BigInteger)
    var
        PersistentBlob: Codeunit "Persistent Blob";
    begin
        if PersistentBlob.Exists(BlobInteger) then
            PersistentBlob.Delete(BlobInteger);
    end;
}