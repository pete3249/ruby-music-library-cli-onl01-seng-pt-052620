require 'pry'

class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end 

    def self.all
        @@all
    end 

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        created_artist = Artist.new(name)
        created_artist.save
        created_artist
    end 

    def songs
        Song.all.select {|song| song.artist = self}
    end 
    
    def add_song(song)
        if song.artist == nil
            song.artist = self
        end 
    end 

    def genres
      self.songs.collect {|song| song.genre}.uniq 
    end 

end 