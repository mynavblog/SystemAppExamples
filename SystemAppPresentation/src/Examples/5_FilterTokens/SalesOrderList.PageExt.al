pageextension 54100 "MNB Sales Order List" extends "Sales Order List"
{
    views
    {
        addlast
        {
            view(MNBNextWeek)
            {
                Caption = 'Next Week Orders';
                Filters = where("Requested Delivery Date" = filter('%nextweek'));
                SharedLayout = true;
            }
            view(MNBLastWeek)
            {
                Caption = 'Last Week Orders';
                Filters = where("Requested Delivery Date" = filter('%lastweek'));
                SharedLayout = true;
            }
        }
    }
}
