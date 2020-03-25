require('pry')
require_relative("./models/album.rb")
require_relative("./models/artist.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => "Frightened Rabbit"
  })
artist1.save()

artist2 = Artist.new({
  'name' => "Catfish & the Bottlemen"
  })
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => "The Midnight Organ Fight",
  'genre' => "Indie"
  })
album1.save()

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => "Painting Of A Panic Attack",
  'genre' => "Indie"
  })
  album2.save()

album3 = Album.new({
  'artist_id' => artist2.id,
  'title' => "The Balcony",
  'genre' => "Rock/Indie"
  })
album3.save()

# album1.delete()

binding.pry
nil
