GENRE = %w[Rock Pop Urban DJ Ballads Tropical Regional Country Instrumental Choir].freeze

User.destroy_all
Event.destroy_all

all_user = []
25.times do |i|
  admin = i % 2 == 0 ? true : false
  user = User.create(email: "user#{i}@example.com", password: "12345678", first_name: "First Name #{i}", last_name: "Last Name #{i}", admin: admin)
  all_user << user
end

25.times do
  event = Event.new(
    title: "Title #{rand(1..100)}",
    description: "Description #{rand(1..100)}",
    datetime: Date.today + rand(1..180),
    duration: rand(30..120),
    genre: GENRE.sample,
    user_id: all_user.sample.id,
    address: ["350 Fifth Ave, New York, NY 10118, USA", "Los Angeles 6801 Hollywood Blvd, Los Angeles, CA 90028, USA", "Chicago 233 S Wacker Dr, Chicago, IL 60606, USA", "Houston 1600 Lamar St, Houston, TX 77010, USA", "Philadelphia 1 Citizens Bank Way, Philadelphia, PA 19148, USA"].sample
  )
  event.save!
  puts 'Done'
end
