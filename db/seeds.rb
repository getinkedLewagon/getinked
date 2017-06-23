#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.destroy_all
Style.destroy_all
Artist.destroy_all
ArtistStyle.destroy_all
User.destroy_all



a_array = []

    a = Artist.create({
    name: "Rob Kelly",
    info: "I do out of this world tattoos specializing in rocketships and birds",
    start_fee: 100,
    rating: nil,
    city: "Barcelona",
    email: "first@gmail.com",
    password: "password1",
    address: "Carrer Tallers, 29, 08001 Barcelona"
    })

 a_array << a

        a_array << Artist.create({
    name: "John Smith",
    info: "I do out of this world tattoos specializing in people faces",
    start_fee: 100,
    rating: nil,
    city: "Paris",
    email: "john@gmail.com",
    password: "john@gmail.com",
    address: "Carrer Tallers, 29, 08001 Barcelona"
    })


a_array << Artist.create({
    name: "Doug Hardy",
    info: "I have been tattooing for over a decade. During that time, I have mastered and refined my own take on classic American street-shop styles",
    start_fee: 50,
    rating: nil,
    city: "Rome",
    email: "second@gmail.com",
    password: "password2",
    address: "Via del Moro, 12, 00153 Rome"
    })
a_array << Artist.create({
    name: "Angelique Houtkamp",
    info: "I do out of this world tattoos specializing in horses and dogs",
    start_fee: 45,
    rating: nil,
    city: "Barcelona",
    email: "third@gmail.com",
    password: "password3",
    address: "Carrer del Comte d'Urgell, 82, 08036 Barcelona"
    })

p "Artists Created"

p a_array

# u_array = []

# u_array << User.create({
#   email: "userone@live.com",
#   encrypted_password: "userpassword1",
#   username: "USER1"
#   })
# u_array << User.create({
#   email: "usertwo@live.com",
#   encrypted_password: "userpassword2",
#   username: "USER2"
#   })
# u_array << User.create({
#   email: "userthree@live.com",
#   encrypted_password: "userpassword3",
#   username: "USER3"
#   })




styles = []




styles << Style.create!({
  name: "Traditional"
  })
styles << Style.create({
  name: "Watercolor"
  })
styles << Style.create({
  name: "Realism"
  })
styles << Style.create({
  name: "Tribal"
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
styles << Style.create({
  name: "Dotwork"
  })
styles << Style.create({
  name: "Geometric"
  })
styles << Style.create({
  name: "Script"
  })
styles << Style.create({
  name: "Illustrative"
  })



style_id = styles.sample

ArtistStyle.create({
  style_id: style_id.id,
  artist_id: a_array[0].id
  })

ArtistStyle.create({
  style_id: style_id.id,
  artist_id: a_array[1].id
  })

ArtistStyle.create({
  style_id: style_id.id,
  artist_id: a_array[2].id
  })


Photo.create({
  url: "https://68.media.tumblr.com/7be6d31baa529a275d17f2fea9c37ea7/tumblr_oomf7lm9um1r4vezwo1_500.jpg",
  artist_id: a_array[1].id
  })

Photo.create({
  url: "https://68.media.tumblr.com/b0670ae6949ddc4230370c02c59a2976/tumblr_oa9zu5nOO41v34nkno1_500.jpg",
  artist_id: a_array[1].id
  })

Photo.create({
  url: "https://68.media.tumblr.com/fbf63393b31e6f479ef65c67f469217e/tumblr_o5u692nWHV1v34nkno1_500.jpg",
  artist_id: a_array[0].id
  })

Photo.create({
  url: "https://s-media-cache-ak0.pinimg.com/originals/b7/97/31/b7973143d630156af17f9eb823ca26d6.jpg",
  artist_id: a_array[2].id
  })

Photo.create({
  url: "https://68.media.tumblr.com/943a3b217dde91527df77bc77a466971/tumblr_ok4ost40hv1r4vezwo1_500.jpg",
  artist_id: a_array[2].id
  })

p "Photos Created"




p "Styles Created"
