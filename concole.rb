require('pry-byebug')
require_relative('models/album.rb')
require_relative('models/artist.rb')

# Artist.delete_all()
# Album.delete_all()

artist1 = Artist.new({
  'name' => "Daft Punk",
});
artist1.save();

artist2 = Artist.new({
  'name' => "The Prodigy",
});
artist2.save();

album1 = Album.new({
  'title' => 'Alive',
  'genre' => 'Dance',
  'artist_id' => "#{artist1.id}"

});
album1.save();

album2 = Album.new({
  'title' => 'Experience',
  'genre' => 'Techno',
  'artist_id' => "#{artist2.id}"

});
album2.save();

album3 = Album.new({
  'title' => 'Human After All',
  'genre' => 'Dance',
  'artist_id' => "#{artist3.id}"

});
album3.save();

binding.pry
nil
