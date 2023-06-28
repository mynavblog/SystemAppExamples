pageextension 54101 "MNB Purchase Order" extends "Purchase Order"
{
    layout
    {
        addfirst(factboxes)
        {
            part(MNBPicture; "MNB Purchase Order Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("No.");
            }
        }
    }
    actions
    {
        addlast(IncomingDocument)
        {
            action(MNBTakeInvoicePhoto)
            {
                Caption = 'Take Invoice Photo';
                ToolTip = 'Allows to take the invoice photo before invoice';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Camera;
                ApplicationArea = All;
                Enabled = CameraIsAvailable;
                trigger OnAction()
                var
                    MNBCameraImage: Codeunit "MNB Camera and Image";
                begin
                    MNBCameraImage.TakePurchaseInvoicePhoto(Rec);
                end;
            }
            action(MNBTakeInvoicePhotoSize)
            {
                Caption = 'Invoice Photo (Size)';
                ToolTip = 'Allows to check size of the photo.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Camera;
                ApplicationArea = All;
                Enabled = CameraIsAvailable;
                trigger OnAction()
                var
                    MNBCameraImage: Codeunit "MNB Camera and Image";
                begin
                    MNBCameraImage.GetPictureSizeAndTransform(Rec);
                end;
            }

        }
    }
    trigger OnOpenPage()
    var
        Camera: Codeunit Camera;
    begin
        CameraIsAvailable := Camera.IsAvailable();
    end;

    trigger OnAfterGetCurrRecord()
    begin

    end;

    var
        CameraIsAvailable: Boolean;
}
