pageextension 54102 "MNB Fixed Asset Card" extends "Fixed Asset Card"
{
    actions
    {
        addlast(navigation)
        {
            action(MNBGetCoordinates)
            {
                Caption = 'Get Coordinates';
                ToolTip = 'Shows GPS Coordinates for the fixed asset';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Map;
                ApplicationArea = All;
                trigger OnAction()
                var
                    AssetLocationMgt: Codeunit "MNB Asset Location Mgt";
                begin
                    AssetLocationMgt.GetGeolocation(Rec);
                end;

            }
        }
    }


}
