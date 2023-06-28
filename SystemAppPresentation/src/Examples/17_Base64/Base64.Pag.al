page 54113 "MNB Base64"
{
    Caption = 'Base64 Example';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Example)
            {
                Caption = 'Example';
                field(Base64TextField; FromBase64Text)
                {
                    ApplicationArea = All;
                    Caption = 'Base64 Text';
                    MultiLine = true;
                    ToolTip = 'Base64 Text value.';
                }
                field(ImportedBase64TextField; ToBase64Text)
                {
                    ApplicationArea = All;
                    Caption = 'Imported Base64 Text';
                    MultiLine = true;
                    ToolTip = 'Imported Base64 Text value.';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetPicture)
            {
                ApplicationArea = All;
                Caption = 'Get Picture';
                ToolTip = 'Get Picture from Base64 Text';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    MNBBase64: Codeunit "MNB Base64";
                begin
                    MNBBase64.DownloadFromBase64(FromBase64Text);
                end;
            }
            action(UploadPicture)
            {
                ApplicationArea = All;
                Caption = 'Upload Picture';
                ToolTip = 'Upload Picture to Base64 Text';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    MNBBase64: Codeunit "MNB Base64";
                begin
                    ToBase64Text := MNBBase64.PictureToBase64();
                end;
            }
        }
    }
    var
        FromBase64Text, ToBase64Text : Text;
}