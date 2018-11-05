class Song
  attr_accessor :name, :artist_name

  @@all = []

  def intitialize(name, artist_name)
    @name = name
    @artist_name = artist_name
     @@all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    song
  end

  def self.create_by_name(new_name)
    song = self.create
    song.name = new_name
    song
  end

  def self.find_by_name(name)
    self.all.find do |el|
      el.name == name ? el : false
    end
  end

  def self.find_or_create_by_name(name)
    x =  self.find_by_name(name)
      x ? x : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def  self.new_from_filename(filename)
    songs_arr = filename.chomp(".mp3").split(" - ")
    new_song = self.new_by_name(songs_arr[1])
    new_song.artist_name = songs_arr[0]
    new_song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end


end
