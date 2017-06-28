
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Photo.destroy_all
# ArtistStyle.destroy_all
# Style.destroy_all
# Artist.destroy_all

#Review.destroy_all
# Chatroom.destroy_all
# Message.destroy_all
# User.destroy_all
# Appointment.destroy_all
# Availability.destroy_all
# Order.destroy_all
# Photo.destroy_all


#   styles = []

#   styles << Style.create({
#     name: "Traditional"
#     })
#   styles << Style.create({
#     name: "Watercolor"
#     })
#   styles << Style.create({
#     name: "Realism"
#     })
#   styles << Style.create({
#     name: "New School"
#     })
#   styles << Style.create({
#     name: "Neo Traditional"
#     })
#   styles << Style.create({
#     name: "Japanese"
#     })

#     styles << Style.create({
#       name: "Dotwork"
#       })
# # styles << Style.create({
# #   name: "Geometric"
# #   })
# # styles << Style.create({
# #   name: "Script"
# #   })
# # styles << Style.create({
# #   name: "Illustrative"
# #   })


# # Hash for random assignment
# def cities_hash
#  cities_hash = { barcelona: { name: "Barcelona",
#                              addresses: ["Travessera de Gracia, 33",
#                                         "Travessera de Dalt", "Via Augusta, 65",
#                                         "Carrer del Bruc", "Carrer de Bailen",
#                                          "Carrer del Rosello",
#                                          "Carrer de Sant Pau",
#                                          "Carrer Ample", "Carrer d'Avinyo",
#                                          "Via Laietana"]
#                 },

#                  rome: { name: "Rome",
#                         addresses: ["Via Ipponio", "Via Sannio", "Via Etruria",
#                                     "Via Segesta", "Via Centuripe", "Via Latina",
#                                     "Via Baccina", "Via Nazionale", "Via Palermo",
#                                     "Via Sicilia", "Via Abruzzi"]
#                  },

#                  berlin: { name: "Berlin",
#                         addresses: ["Torstrasse", "Palisadenstrasse", "Ohmstrasse"          ,"Annenstrasse", "Stralauerstrasse",
#                                     "Moritzplatz", "Wassertorstrasse",
#                                     "Briesestrasse"]
#                  },

#                  paris: { name: "Paris",
#                         addresses: ["Rue de Rivoli", "Rue de Louvre",
#                                     "Rue Etienne Mercel", "Rue Tiquetonne",
#                                     "Rue Greneta", "Rue Chapon" ]
#                  },

#                  london: { name: "London",
#                         addresses: ["Orange Street", "Hop Gardens",
#                                     "Bainbridge St", "Catherine Street",
#                                     "Henrietta St" ]}
#                   }
# end

# def start_fee_array
#   start_fee_array = [60, 65, 70, 75, 80, 85, 90, 95, 100]
# end
# # Generate Traditional Tattooers from Instagram (9)
# traditional_artist_hash = { style: Style.find_by(name: "Traditional"),
#                           artists: ['dennis_gutierrez', 'fabriziomele',
#                                     'gordoncombs',
#                                     'joeellistattoo', 'pauldobleman',
#                                     'rafadecraneo', 'vinzflag', 'xcyrx'] }

# # Generate Traditional Tattooers from Instagram (8)

# realism_artist_hash = { style: Style.find_by(name: "Realism"),
#                          artists: ['megan_massacre', 'sununala',
#                                    'rafaramostattoo','mills06', 'trashcore',
#                                    'zakkhanattattoo', 'lizvnenom',
#                                    'mariotoloza_'] }

# # Fetch New School Tattooers from Instagram (5)

# new_school_artist_hash = { style: Style.find_by(name: "New School"),
#                           artists: ['laurent_lajeunesse', 'debbieripper_tattoo',
#                                     'loxiput_tattoo','wendellyap', 'austinzfoo'] }

# # F }etch Neo Traditional Tattooers from Instagram (7)

# neo_traditional_artist_hash = { style: Style.find_by(name: "Neo Traditional"),
#                                  artists: ['Denis', 'carlykroll',
#                                            'haydntattoo', 'samanthamoth13',
#                                            'causalitytattoo', 'motar_ink'] }

# # Fetch Japanese Tattooers from Instagram (7)

# japanese_artist_hash = { style: Style.find_by(name: "Japanese"),
#                           artists: ['japanesetattoo', 'horishige_5',
#                                     'elliottwells666', 'brinditattoo',
#                                     'larascotton', 'stueysingh'] }

# dotwork_artist_hash = { style: Style.find_by(name: "Dotwork"),
#                         artists: ['mowgli_artist', 'vivian_ferreiraartist',
#                                   'phoenix.mendoza.tattoo','artsc0re',
#                                   'carloroffare','john_trad_tattoo',
#                                   'alchemistsvalley'] }

# watercolor_artist_hash = { style: Style.find_by(name: "Watercolor"),
#                            artists: ['rodrigotas', 'streettatoo', 'sashaunisex',
#                                      'findyoursmile', 'jayfreestyle', 'carballocandelaria',
#                                       'tattoojune'] }

# # script_artist_array = []

# # illustrative_artist_array = []


# def artist_full(username)
#   url = "https://hashtagbattle.com/v1/instagram/users/#{username}?token=754673ab54bcde3245"
#   parse = JSON.parse(open(url).read)
# end

# def artist_data(parse)
#   extract_user_data = parse["entry_data"]["ProfilePage"][0]["user"]
# end

# def artist_pictures(parse)
#   extract_user_pictures = parse["entry_data"]["ProfilePage"][0]["user"]["media"]["nodes"]
# end

# # User on each of the nodes elements to extract picture url [0]["display_src"]


# def populate_style(style_hash)
#   style_hash[:artists].each do |username|
#     full_info = artist_full(username)

#     profile = artist_data(full_info)
#     pictures = artist_pictures(full_info)

#     new_artist = Artist.new
#     new_artist.name = profile["full_name"]
#     new_artist.info = profile["biography"]
#     new_artist.avatar = profile["profile_pic_url"]
#     new_artist.email = "#{username}@getinked.com"
#     new_artist.styles = [style_hash[:style]]
#     new_artist.start_fee = start_fee_array.sample

#     city = cities_hash.keys.sample

#     new_artist.city = cities_hash[city][:name]
#     new_artist.address = "#{cities_hash[city][:addresses].sample}, #{new_artist.city}"

#     puts "#{username} saved as an artist!"

#     pictures.each do |picture|
#       photo = Photo.new
#       photo.artist = new_artist
#       photo.url = picture["display_src"]
#       photo.save
#       puts "    photo saved for #{username}!"
#     end
#   end
# end

# populate_style(traditional_artist_hash)
# populate_style(japanese_artist_hash)










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







