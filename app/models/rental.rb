class Rental < ActiveRecord::Base
    belongs_to :client
    belongs_to :vhs

    def due_date
      self.created_at.to_date + 7
    end


# find : recordCreateDate
# Add one week to recordCreateDate
# return

#     end




    # - `Rental#due_date` - returns a date one week 
    # from when the record was created

end