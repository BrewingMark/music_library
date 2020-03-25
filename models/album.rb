require_relative('../db/sql_runner')
require_relative('./artist')

class Album

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      title,
      genre
    ) values
    (
      $1,
      $2
    )
    RETURNING id"
    values = [@title, @genre]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    sql = "
    UPDATE albums SET (
      title,
      genre
    ) =
    (
      $1,
      $2
    )
    WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql, [])
    return orders.map {|album| Album.new(album)}
  end

  def artist()
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@artist_id]
    artist_hash = SqlRunner.run(sql, values)[0]
    return Artist.new(artist_hash)
  end

  def find()
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    album_hash = results.first
    album = Album.new(album_hash)
    return album
  end

end
