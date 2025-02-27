# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
data = JSON.parse(response)

results = data["results"]

 15.times do |t|
   movie = Movie.create!(
     title: results[t]["title"],
     overview: results[t]["overview"],
     rating: results[t]["vote_average"],
     poster_url: "https://image.tmdb.org/t/p/original#{results[t]["poster_path"]}"
   )
end
