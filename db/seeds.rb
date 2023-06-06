GENRE = %w[rock pop urban dance/dj ballads tropical regional country instrumental choir].freeze
user = User.create(email: "33@gmail.com" , password: "12345678", first_name: "Juan", last_name: "Diaz", admin: false)
user_2 = User.create(email: "23@gmail.com" , password: "123456", first_name: "John", last_name: "Doe", admin: true)

all_user = user, user_2
25.times do
  Event.create(
    title: "Title #{rand(1..100)}",
    description: "Description #{rand(1..100)}",
    date: Date.today + rand(1..180),
    duration: rand(30..120),
    genre: GENRE.sample,
    user_id: all_user.sample.id,
    location: ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia"].sample
  )
  puts 'Done'
end
