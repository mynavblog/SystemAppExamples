page 54106 "MNB Next Occurrence"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Next Occurrence';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Next Occurrence';
                field(Name; RecurrenceID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies set recurrence.Use Assist Edit to set it.';
                    Editable = false;
                    trigger OnAssistEdit()
                    var
                        OccurrenceMgt: Codeunit "MNB Occurrence Mgt.";
                    begin
                        RecurrenceText := OccurrenceMgt.OpenRecurrenceScheduleCard(RecurrenceID);
                    end;
                }
                field(RecurrenceTextField; RecurrenceText)
                {
                    Caption = 'Recurrence Description';
                    ToolTip = 'Specifies the description for the recurrence schedule.';
                    Editable = false;
                }

                field(LastOccurrenceDateField; LastOccurrenceDateTime)
                {
                    Caption = 'Last Occurrence Date-Time';
                    ToolTip = 'Specifies the last occurrence of the schedule.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetNextDate)
            {
                Caption = 'Get Next Date-Time';
                Image = NextRecord;
                ToolTip = 'Get next occurrence of the schedule.';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    OccurrenceMgt: Codeunit "MNB Occurrence Mgt.";
                begin
                    OccurrenceMgt.ShowNextDate(RecurrenceID, LastOccurrenceDateTime);
                end;
            }
        }
    }



    var
        LastOccurrenceDateTime: DateTime;
        RecurrenceID: Guid;
        RecurrenceText: Text;
}