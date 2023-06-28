codeunit 54111 "MNB XML Export"
{
    procedure ExportToXML()
    var
        MyXMLTxt: BigText;
    begin
        ExportCustomersToXML(MyXMLTxt);
        DownloadXML(MyXMLTxt);
    end;

    local procedure DownloadXML(var MyXMLTxt: BigText)
    var
        TempBlob: Codeunit "Temp Blob";
        FileName: Text;
        FileNameTxt: Label 'Customers.xml';
        OutStream: OutStream;
        InStream: InStream;
    begin
        TempBlob.CreateOutStream(OutStream);
        MyXMLTxt.Write(OutStream);
        TempBlob.CreateInStream(InStream);
        FileName := FileNameTxt;
        DownloadFromStream(InStream, '', '', '', FileName);
    end;

    procedure ExportCustomersToXML(var MyXMLTxt: BigText)
    var
        Customer: Record Customer;
        XmlWriter: Codeunit XmlWriter;
    begin
        XmlWriter.WriteStartDocument();
        XmlWriter.WriteStartElement('Customers');
        if Customer.FindSet() then
            repeat
                XmlWriter.WriteStartElement('Customer');
                XmlWriter.WriteAttributeString('number', Customer."No.");
                XmlWriter.WriteElementString('name', Customer.Name);
                XmlWriter.WriteElementString('address', Customer.Address);
                XmlWriter.WriteEndElement; // Customer
            until Customer.Next() = 0;
        XmlWriter.WriteEndElement; // Customers
        XmlWriter.WriteEndDocument();
        XmlWriter.ToBigText(MyXMLTxt);
    end;
}