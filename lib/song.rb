class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all 
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(s_name)
    song = Song.new
    song.name = s_name
    song
  end

  def self.create_by_name(s_name)
    song = Song.create
    song.name = s_name
    song
  end

  def self.find_by_name(s_name)
    Song.all.find do |s| s.name == s_name
    end
  end

  def self.find_or_create_by_name(s_name)
    Song.find_by_name(s_name) || Song.create_by_name(s_name)
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(s_name)
    parts = s_name.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
    
  def self.create_from_filename(s_name)
    parts = s_name.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
      @@all = []
  end


end
