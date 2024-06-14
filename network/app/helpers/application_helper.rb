module ApplicationHelper
    def formatted_date(date_string)
        begin
            date = DateTime.parse(date_string)
            date.strftime("%d/%m/%Y %H:%M:%S")
        rescue ArgumentError, TypeError
            date_string
        end
    end
end
