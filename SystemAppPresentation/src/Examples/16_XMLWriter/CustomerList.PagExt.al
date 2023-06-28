pageextension 54104 "MNB Customer List" extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            action(MNBExportToXML)
            {
                Caption = 'Export to XML';
                ToolTip = 'Export to XML';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    XMLExport: Codeunit "MNB XML Export";
                begin
                    XMLExport.ExportToXML();
                end;
            }
            action(MNBExportToZip)
            {
                Caption = 'Export to Zip';
                ToolTip = 'Export to Zip';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    MNBZip: Codeunit "MNB Zip";
                begin
                    MNBZip.ExportToZip();
                end;
            }
        }
    }


}