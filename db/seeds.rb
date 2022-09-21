# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."
Bookmark.destroy_all
Movie.destroy_all
puts "Database cleaned"

require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/popular'
json = URI.open(url).read
data = JSON.parse(json)

data['results'].first(30).each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
puts "Movies created"
