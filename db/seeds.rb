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
