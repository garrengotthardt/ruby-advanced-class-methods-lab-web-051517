require 'pry'

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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
   song = self.create
   song.name = song_name
   #binding.pry
   song
    #@@all.detect {|song| song.name = song_name}
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.detect {|song_instance| song_instance.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_filename)
    song = self.new_by_name(song_filename.split(" - ")[1].split(".")[0])
    song.artist_name = song_filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(song_filename)
    self.new_from_filename(song_filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
