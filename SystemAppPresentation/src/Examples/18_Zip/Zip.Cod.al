codeunit 54113 "MNB Zip"
{

    procedure ExportToZip()
    var
        MNBXMLExport: Codeunit "MNB XML Export";
        MyXMLTxt: BigText;
    begin
        MNBXMLExport.ExportCustomersToXML(MyXMLTxt);
        CreateZipFile(MyXMLTxt);
    end;

    local procedure CreateZipFile(var MyXMLTxt: BigText)
    var
        DataCompression: Codeunit "Data Compression";
        TempBlob: Codeunit "Temp Blob";
        FileName: Text;
        FileNameTxt: Label 'Customers.zip';
        InStream, InStreamZip : InStream;
        OutStream, OutStreamZip : OutStream;
    begin
        DataCompression.CreateZipArchive();

        //Add files
        TempBlob.CreateOutStream(OutStream);
        MyXMLTxt.Write(OutStream);
        TempBlob.CreateInStream(InStream);
        DataCompression.AddEntry(InStream, 'customers.xml');
        DataCompression.AddEntry(InStream, 'customers_2.xml');

        //Save zip file
        TempBlob.CreateOutStream(OutStreamZip);
        DataCompression.SaveZipArchive(OutStreamZip);
        TempBlob.CreateInStream(InStreamZip);
        FileName := FileNameTxt;
        DownloadFromStream(InStreamZip, '', '', '', FileName);
    end;
}