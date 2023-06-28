///<summary>
/// Shows how to get next occurrence for specific schedule
/// <see cref="https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Recurrence%20Schedule"/>
/// </summary>
codeunit 54107 "MNB Occurrence Mgt."
{
    procedure OpenRecurrenceScheduleCard(var RecurrenceID: Guid): Text
    var
        RecurrenceSchedule: Codeunit "Recurrence Schedule";
    begin
        RecurrenceSchedule.OpenRecurrenceSchedule(RecurrenceID);
        exit(RecurrenceSchedule.RecurrenceDisplayText(RecurrenceID));
    end;

    procedure ShowNextDate(RecurrenceID: Guid; LastDate: DateTime)
    var
        RecurrenceSchedule: Codeunit "Recurrence Schedule";
        NextOccurrenceTxt: Label 'Next Occurrence: %1', Comment = '%1 - date-time';
    begin
        Message(NextOccurrenceTxt, RecurrenceSchedule.CalculateNextOccurrence(RecurrenceID, LastDate));
    end;

}