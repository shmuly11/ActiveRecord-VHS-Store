class Client < ActiveRecord::Base
    has_many :rentals
    has_many :vhs, through: :rentals


    def self.first_rental(client, movie_title)
        new_client = Client.create(name: client)
        #movie = movie.map where movie title == movie
        movie = Movie.find_by(title: movie_title)
        #vhs = vhs.map where movie_id == movie.id 
        #binding.pry
        vhs = Vhs.where(movie_id: movie.id)
        vhs.map do |vhs|
        #rentals = rental.map vhs_id == vhs.id
        rentals = Rental.where(vhs_id: vhs.id)
        current_rentals = rentals.find {|rental| rental.current == false}
        new_rental = Rental.create(current: true, vhs_id: vhs.id, client_id: new_client.id)
        return new_rental
        end
        # if current_rentals
            
        # else
        #    puts "sorry we dont have any of those left! try another"
        # end

    end

end