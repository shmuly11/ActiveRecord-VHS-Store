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
    end


    def return_one(vhs_ins)
       rentals = Rental.select{|rental| rental.client_id == self.id}
        vhs = rentals.find{|rental| rental.vhs_id == vhs_ins.id}
        # binding.pry
        vhs.update(current: false) if vhs
        # Vhs.update(vhs.id) 
    end

    def self.paid_most
        rentals = 0
        best_client = Client.first
        Client.all.map do |client|
            if  client.rentals.count > rentals
            rentals = client.rentals.count
            best_client = client
            end
        end
        # binding.pry
        best_client
    end
end