page 54101 "MNB Math Operations"
{
    ///<summary>
    /// Shows example of math module
    /// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Math"/>
    /// </summary>

    Caption = 'Math Operations';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(xDecimal; xDecimal)
                {
                    Caption = 'Let the X be';
                    ToolTip = 'Specifies the X.';
                    ApplicationArea = All;
                    DecimalPlaces = 2 : 5;
                }
                field(yDecimal; yDecimal)
                {
                    Caption = 'Let the Y be';
                    ToolTip = 'Specifies the Y.';
                    ApplicationArea = All;
                    DecimalPlaces = 2 : 5;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(MaxValue)
            {
                Caption = 'Get Max';
                ToolTip = 'Gets max value of two.';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Math: Codeunit Math;
                    MaxIsMsg: Label 'Max is: %1';
                begin
                    Message(MaxIsMsg, Math.Max(xDecimal, yDecimal));
                end;
            }
            action(MinValue)
            {
                Caption = 'Get Min';
                ToolTip = 'Gets min value of two.';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Math: Codeunit Math;
                    MinIsMsg: Label 'Min is: %1';
                begin
                    Message(MinIsMsg, Math.Min(xDecimal, yDecimal));
                end;
            }
            action(FloorValue)
            {
                Caption = 'Floor X';
                ToolTip = 'Gets Floor value of X.';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Math: Codeunit Math;
                    FloorIsMsg: Label 'Floor is: %1';
                begin
                    Message(FloorIsMsg, Math.Floor(xDecimal));
                end;
            }
            action(CeilingValue)
            {
                Caption = 'Ceiling X';
                ToolTip = 'Gets Ceiling value of X.';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Math: Codeunit Math;
                    CeilingIsMsg: Label 'Ceiling is: %1';
                begin
                    Message(CeilingIsMsg, Math.Ceiling(xDecimal));
                end;
            }
            action(TruncateValue)
            {
                Caption = 'Truncate X';
                ToolTip = 'Gets Truncate value of X.';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Math: Codeunit Math;
                    TruncateIsMsg: Label 'Truncate is: %1';
                begin
                    Message(TruncateIsMsg, Math.Truncate(xDecimal));
                end;
            }
            action(RemainderValue)
            {
                Caption = 'Remainder';
                ToolTip = 'Gets Remainder value of X and Y.';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Math: Codeunit Math;
                    RemainderIsMsg: Label 'Remainder is: %1';
                begin
                    Message(RemainderIsMsg, Math.IEEERemainder(xDecimal, yDecimal));
                end;
            }
        }
    }
    var
        xDecimal, yDecimal : Decimal;
}
