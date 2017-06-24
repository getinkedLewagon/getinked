require 'pry'
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.destroy_all
ArtistStyle.destroy_all
Style.destroy_all
Artist.destroy_all

User.destroy_all

styles = []

styles << Style.create({
  name: "Traditional"
  })
styles << Style.create({
  name: "Watercolor"
  })
styles << Style.create({
  name: "Realism"
  })
styles << Style.create({
  name: "New School"
  })
styles << Style.create({
  name: "Neo Traditional"
  })
styles << Style.create({
  name: "Japanese"
  })
# styles << Style.create({
#   name: "Dotwork"
#   })
# styles << Style.create({
#   name: "Geometric"
#   })
# styles << Style.create({
#   name: "Script"
#   })
# styles << Style.create({
#   name: "Illustrative"
#   })

puts "Styles Created!"

# Arrays for random assignment
cities_array = ["Barcelona", "Rome", "Berlin", "Paris", "London"]
start_fee_array = [60, 65, 70, 75, 80, 85, 90, 95, 100]

# Generate Traditional Tattooers from Instagram (9)
traditional_artist_array = ['dennis_gutierrez', 'fabriziomele', 'gordoncombs',
                            'joeellistattoo', 'pauldobleman',
                            'rafadecraneo', 'vinzflag', 'xcyrx']

# Generate Traditional Tattooers from Instagram (8)

realism_artist_array = ['megan_massacre', 'sununala', 'rafaramostattoo',
                          'mills06', 'trashcore', 'zakkhanattattoo', 'lizvnenom',
                          'mariotoloza_']

# Fetch New School Tattooers from Instagram (5)

new_school_artist_array = ['laurent_lajeunesse', 'debbieripper_tattoo', 'loxiput_tattoo',
                            'wendellyap', 'austinzfoo']

# Fetch Neo Traditional Tattooers from Instagram (7)

neo_traditional_artist_array = ['shio1red', 'carlykroll', 'haydntattoo', 'samanthamoth13',
                                'causalitytattoo', 'motar_ink', 'jptattooartist']

# Fetch Japanese Tattooers from Instagram (7)

japanese_artist_array = ['japanesetattoo', 'horishige_5', 'elliottwells666', 'brinditattoo',
                          'larascotton', 'stueysingh', ]

# dotwork_artist_array = []

# geometric_artist_array = []

# script_artist_array = []

# illustrative_artist_array = []


def artist_full(username)
  url = "https://hashtagbattle.com/v1/instagram/users/#{username}?token=754673ab54bcde3245
"
  parse = JSON.parse(open(url).read)
end

def artist_data(parse)
  extract_user_data = parse["entry_data"]["ProfilePage"][0]["user"]
end

def artist_pictures(parse)
  extract_user_pictures = parse["entry_data"]["ProfilePage"][0]["user"]["media"]["nodes"]
end

# User on each of the nodes elements to extract picture url [0]["display_src"]

traditional_artist_array.each do |username|
  full_info = artist_full(username)
  profile = artist_data(full_info)
  pictures = artist_pictures(full_info)

  new_artist = Artist.new
  new_artist.city = cities_array.sample
  new_artist.name = profile["full_name"]
  new_artist.info = profile["biography"]
  new_artist.email = "#{username}@getinked.com"
  new_artist.styles = [styles[0]]
  new_artist.start_fee = start_fee_array.sample
  new_artist.save

  puts "#{username} saved as an artist!"

  pictures.each do |picture|
    photo = Photo.new
    photo.artist = new_artist
    photo.url = picture["display_src"]
    photo.save
    puts "    photo saved for #{username}!"
  end


end










# Generate Watercolor   Tattooers from Instagram
# Generate Realism Tattooers from Instagram
# Generate Tribal Tattooers from Instagram
# Generate New School Tattooers from Instagram
# Generate Neo Traditional Tattooers from Instagram
# Generate Japanese Tattooers from Instagram
# Generate Dotwork Tattooers from Instagram
# Generate Geometric Tattooers from Instagram
# Generate Script Tattooers from Instagram
# Generate Illustrative Tattooers from Instagram







