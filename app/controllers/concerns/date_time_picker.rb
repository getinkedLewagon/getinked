module DateTimePicker
    def string_into_date(date_to_convert)
        Date.strptime(date_to_convert,"%m/%d/%Y")
    end
    def datepicker_into_object(dates)
        dates.split("-").map{|date| Date.strptime(date.strip,"%m/%d/%Y")}

    end
    def datepicker_into_strings(dates)
      dates.split("-")
    end
end
