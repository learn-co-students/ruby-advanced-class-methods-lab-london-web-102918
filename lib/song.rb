require 'pry'


class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song_name if song_name == song.name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end


# would not accomodate formatting errors or filetypes not 3 characters

  def self.new_from_filename(filename)
    new_song = new_by_name(filename.chomp(".mp3").split("- ")[1])
    new_song.artist_name = filename.split(" -")[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = create_by_name(filename.chomp(".mp3").split("- ")[1])
    new_song.artist_name = filename.split(" -")[0]
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
