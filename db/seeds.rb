GENRE = %w[Rock Pop Urban DJ Ballads Tropical Regional Country Instrumental Choir].freeze

EVENT_TITLES = [
  "Live Jazz Night at The Blue Note",
  "Acoustic Jam Session at The Local Pub",
  "Rock 'n' Roll Show at The Electric Lounge",
  "Latin Salsa Fiesta at Casa de la Musica",
  "Late Night DJ Party at LooLoo Club",
  "Folk Music Gathering at The Rustic Barn",
  "R&B Soul Showcase at The Groove Lounge",
  "Country Music Hoedown at The Wild West Saloon",
  "Reggae Beach Party at Paradise Beach Club",
  "Indie Music Festival at The Outdoor Amphitheater"
].freeze

EVENT_DESCRIPTIONS = [
  "Join us for a night of smooth jazz melodies performed by talented musicians.",
  "Bring your instrument and join in the fun as we jam together in an acoustic setting.",
  "Get ready to rock out with high-energy performances from local bands.",
  "Experience the vibrant rhythms of Latin music and dance the night away.",
  "Enjoy an enchanting evening of classical compositions performed by a renowned orchestra.",
  "Immerse yourself in the soulful sounds of folk music and heartfelt storytelling.",
  "Indulge in the smooth and sultry sounds of R&B and soul music.",
  "Put on your cowboy boots and join us for a lively country music hoedown.",
  "Feel the laid-back vibes of reggae music while enjoying the beach atmosphere.",
  "Discover the best of indie music with a diverse lineup of emerging artists."
].freeze

EVENT_DATETIMES = [
  "2023-06-11 19:00",
  "2023-06-12 20:30",
  "2023-06-13 21:15",
  "2023-06-14 18:45",
  "2023-06-15 19:30",
  "2023-06-16 20:00",
  "2023-06-17 22:00",
  "2023-06-18 17:30",
  "2023-06-19 19:45",
  "2023-06-20 21:30"
].freeze

DISCOVER_TITLES = [
  "Embracing Love",
  "On the Edge",
  "Summer Vibes",
  "Memories Unfold",
  "Midnight Groove",
  "Serenity",
  "Powerful R&B Ballad: Broken Hearts",
  "Baila!",
  "Open Road",
  "Dreamy Wanderlust"
].freeze

DISCOVER_CONTENTS = [
  "A heartfelt ballad that explores the theme of love and connection.",
  "A high-energy rock anthem that pushes the boundaries of musical intensity.",
  "A catchy pop hit that captures the carefree spirit of summer.",
  "A reflective folk song that evokes nostalgic emotions and bittersweet memories.",
  "An instrumental jazz fusion track with a captivating midnight groove.",
  "A soothing acoustic melody that brings a sense of serenity and calm.",
  "A powerful R&B ballad that delves into the complexities of heartbreak and resilience.",
  "A lively Latin dance track that will make you move and groove.",
  "An uplifting country tune that celebrates freedom and the open road.",
  "A dreamy indie pop song that sparks a sense of wanderlust and imagination."
].freeze

ADDRESSES = [
  "350 Fifth Ave, New York, NY 10118, USA",
  "6801 Hollywood Blvd, Los Angeles, CA 90028, USA",
  "233 S Wacker Dr, Chicago, IL 60606, USA",
  "1600 Lamar St, Houston, TX 77010, USA",
  "1 Citizens Bank Way, Philadelphia, PA 19148, USA",
  "123 Main St, San Francisco, CA 94101, USA",
  "555 Broadway, Nashville, TN 37203, USA",
  "987 Elm St, Miami, FL 33130, USA",
  "456 Oak St, Seattle, WA 98101, USA",
  "789 Maple Ave, Boston, MA 02108, USA"
].freeze

ARTIST_NAMES = [
  "John Doe", "Jane Smith", "Mike Johnson", "Emily Brown", "Alex Davis",
  "Olivia Wilson", "Sam Thompson", "Sophia Anderson", "David Martinez", "Emma Taylor"
].freeze

ARTIST_INSTRUMENTS = [
  "Guitar", "Piano", "Drums", "Violin", "Saxophone",
  "Trumpet", "Bass Guitar", "Vocals", "Flute", "Cello"
].freeze

ARTIST_LOCATIONS = [
  "New York", "Los Angeles", "Chicago", "Houston", "Philadelphia",
  "Miami", "San Francisco", "Seattle", "Atlanta", "Boston"
].freeze

ARTIST_DESCRIPTIONS = [
  "Experienced and versatile musician specializing in various genres.",
  "Passionate about delivering captivating performances that leave a lasting impression.",
  "Highly skilled instrumentalist with a unique and captivating style.",
  "Talented artist with a knack for creating memorable melodies.",
  "Bringing energy and enthusiasm to every stage and performance.",
  "Versatile and adaptable musician, adept at entertaining diverse audiences.",
  "Known for creating an immersive and engaging musical experience.",
  "Bringing a blend of traditional and contemporary sounds to the stage.",
  "Captivating audiences with soulful vocals and exceptional musicality.",
  "Creating a vibrant atmosphere with a seamless fusion of musical genres."
].freeze


User.destroy_all
Event.destroy_all
Discover.destroy_all
Dashboard.destroy_all

10.times do |i|
  artist = i % 2 == 0 ? true : false
  user = User.new(
    email: "user#{i}@example.com",
    password: "12345678",
    first_name: "First Name #{i}",
    last_name: "Last Name #{i}",
    artist: artist
  )

  image_path = Rails.root.join("app", "assets", "images", "users", "#{i + 1}.jpg")
  # Attach the image file if it exists, otherwise use a default image
  if File.exist?(image_path)
    user.image.attach(io: File.open(image_path), filename: "#{i + 1}.jpg", content_type: "image/jpeg")
  end

  user.save!
  puts 'User created'
end

all_users = User.all

10.times do |i|
  event = Event.new(
    title: EVENT_TITLES.sample,
    description: EVENT_DESCRIPTIONS.sample,
    datetime: EVENT_DATETIMES.sample,
    duration: rand(30..120),
    genre: GENRE.sample,
    user_id: all_users.sample.id,
    address: ADDRESSES.sample
  )

  image_path = Rails.root.join("app", "assets", "images", "events", "#{i + 1}.jpg")

  # Attach the image file if it exists, otherwise use a default image
  if File.exist?(image_path)
    event.image.attach(io: File.open(image_path), filename: "#{i + 1}.jpg", content_type: "image/jpeg")
  end

  event.save!
  puts 'Event created'
end

10.times do |i|
  dashboard = Dashboard.new(
    artist_genre: GENRE.sample,
    artist_count: rand(1..10),
    artist_name: ARTIST_NAMES.sample,
    artist_instrument: ARTIST_INSTRUMENTS.sample,
    artist_location: ARTIST_LOCATIONS.sample,
    artist_travel: [true, false].sample || false,
    artist_radius: rand(10..100),
    artist_cities: "#{ARTIST_LOCATIONS.sample}, #{ARTIST_LOCATIONS.sample}",
    artist_description: ARTIST_DESCRIPTIONS.sample,
    artist_price: rand(50..500),
    user_id: all_users.sample.id
  )

  image_path = Rails.root.join("app", "assets", "images", "dashboards", "#{i + 1}.jpg")

  # Attach the image file if it exists, otherwise use a default image
  if File.exist?(image_path)
    dashboard.image.attach(io: File.open(image_path), filename: "#{i + 1}.jpg", content_type: "image/jpeg")
  end

  dashboard.save!
  puts 'Dashboard created'
end

all_dashboards = Dashboard.all

10.times do |i|
  discover = Discover.new(
    title: DISCOVER_TITLES.sample,
    content: DISCOVER_CONTENTS.sample,
    likes: rand(0..100),
    plays: rand(0..100),
    genre: GENRE.sample,
    saved: [true, false].sample,
    start_time: rand(1.0..10.0).round(2),
    end_time: rand(10.0..20.0).round(2),
    dashboard_id: all_dashboards.sample.id
  )

  video_path = Rails.root.join('app', 'assets', 'videos', "#{i + 1}.mp4")

  # Attach the video file if it exists, otherwise fallback to the default image
  if File.exist?(video_path)
    discover.video.attach(io: File.open(video_path), filename: "#{i + 1}.mp4", content_type: 'video/mp4')
  end

  discover.save!
  puts 'Discover created'
end
