require('pry')
require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new({
  'name' => "Frightened Rabbit"
  })

artist2 = Artist.new({
  'name' => "Catfish & the Bottlemen"
  })

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => "The Midnight Organ Fight",
  'genre' => "Indie"
  })

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => "Painting Of A Panic Attack",
  'genre' => "Indie"
  })

album3 = Album.new({
  'artist_id' => artist2.id,
  'title' => "The Balcony",
  'genre' => "Rock/Indie"
  })

binding.pry
nil
