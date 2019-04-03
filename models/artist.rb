require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) returning ID"
    values = [@name]
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map{|artist| Artist.new(artist)}
  end

  def album
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    return results.map{|album| Album.new(album)}
  end

end
