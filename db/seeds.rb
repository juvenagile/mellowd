# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


GENRE = %w[rock pop urban dance/dj ballads tropical regional country instrumental choir].freeze

25.times do
  Event.create(
    title: "Title #{rand(1..100)}",
    description: "Description #{rand(1..100)}",
    date: Date.today + rand(1..180),
    duration: rand(30..120),
    genre: GENRE.sample,
    location: ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia"].sample
  )
  puts 'Done'
end
