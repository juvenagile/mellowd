GENRE = %w[rock pop urban dance/dj ballads tropical regional country instrumental choir].freeze

all_user = []
for i in 1..25 do
  admin = i % 2 == 0 ? true : false
  user = User.create(email: "user#{i}@example.com", password: "12345678", first_name: "First Name #{i}", last_name: "Last Name #{i}", admin: admin)
  all_user << user
end


25.times do
  Event.create(
    title: "Title #{rand(1..100)}",
    description: "Description #{rand(1..100)}",
    date: Date.today + rand(1..180),
    duration: rand(30..120),
    genre: GENRE.sample,
    user_id: all_user.sample.id,
    address: ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia"].sample
  )
  puts 'Done'
end
