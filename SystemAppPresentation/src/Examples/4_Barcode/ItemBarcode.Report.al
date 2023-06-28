report 54100 "MNB Item Barcode"
{
    ///<summary>
    /// Shows how to create barcodes for item
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Barcode"/>
    /// <seealso cref="https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-report-add-barcodes?tabs=1d"/>
    /// <seealso cref="https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-report-barcode-fonts"/>
    /// </summary>

    ApplicationArea = All;
    Caption = 'Item Barcode';
    UsageCategory = ReportsAndAnalysis;
    WordLayout = './src/Examples/4_Barcode/ItemBarcode.docx';
    DefaultLayout = Word;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Ean13Txt; Ean13Txt) { }
            column(Code39Txt; Code39Txt) { }
            column(Code128Txt; Code128Txt) { }
            column(QRTxt; QRTxt) { }
            column(AztecTxt; AztecTxt) { }

            trigger OnAfterGetRecord()
            var
                BarcodeFontProvider: Interface "Barcode Font Provider";
                BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
            begin
                BarCodeTxt := '978020137962';
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                Ean13Txt := BarcodeFontProvider.EncodeFont(BarCodeTxt, Enum::"Barcode Symbology"::"EAN-13");
                Code39Txt := BarcodeFontProvider.EncodeFont(Item."No.", Enum::"Barcode Symbology"::Code39);
                Code128Txt := BarcodeFontProvider.EncodeFont(StrSubstNo('%1 %2', Item."No.", Item.Description), Enum::"Barcode Symbology"::Code128);

                BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarCodeTxt := 'URL:https://www.mynavblog.com';
                QRTxt := BarcodeFontProvider2D.EncodeFont(BarCodeTxt, Enum::"Barcode Symbology 2D"::"QR-Code");
                AztecTxt := BarcodeFontProvider2D.EncodeFont(BarCodeTxt, Enum::"Barcode Symbology 2D"::Aztec);
            end;
        }
    }
    var
        AztecTxt, Code39Txt, Code128Txt, Ean13Txt, QRTxt : Text;
        BarCodeTxt: Text;
}
