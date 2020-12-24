class Movie < ActiveRecord::Base
    has_many :movie_genres
    has_many :genres, through: :movie_genres
    has_many :vhs
    has_many :rentals, through: :vhs


    def report_stolen
    not_rented =  self.rentals.where(current: false)
    not_rented.take.vhs.delete
        puts "THANK YOU FOR YOUR REPORT. WE WILL LAUNCH AN INVESTIGATION."
end
#     rent = Rental.all.select{|rental| !rental.current}
#     rent.select{|vhs|vhs.movies == self}.sample.destroy

end