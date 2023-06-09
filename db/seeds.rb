genre = %w[Rock Pop Urban Dance/DJ Ballads Tropical Regional Country Instrumental Choir]

User.destroy_all
Event.destroy_all


25.times do |i|
  admin = i % 2 == 0 ? true : false
  user = User.create(email: "user#{i}@example.com", password: "12345678", first_name: "First Name #{i}", last_name: "Last Name #{i}", admin: admin)
  5.times do
    event = Event.new(
      title: "Title #{rand(1..100)}",
      description: "Description #{rand(1..100)}",
      date: Date.today + rand(1..180),
      duration: rand(30..120),
      time: "#{rand(0..23).to_s.rjust(2, '0')}:#{rand(0..59).to_s.rjust(2, '0')}",
      genre: genre.sample,
      user: user,
      address: ["350 Fifth Ave, New York, NY 10118, USA", "Los Angeles: 6801 Hollywood Blvd, Los Angeles, CA 90028, USA", "Chicago: 233 S Wacker Dr, Chicago, IL 60606, USA", "Houston: 1600 Lamar St, Houston, TX 77010, USA", "Philadelphia: 1 Citizens Bank Way, Philadelphia, PA 19148, USA"].sample
    )
    event.save!
    puts 'Done'
  end
end
