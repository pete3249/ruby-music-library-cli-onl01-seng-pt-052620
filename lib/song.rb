require 'pry'

class Song

    attr_accessor :name
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil
            self.artist=(artist)
        end 
        if genre != nil
            self.genre=(genre)
        end 
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
        created_song = Song.new(name)
        created_song.save
        created_song
    end 

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def artist
        @artist
    end 

    def genre=(genre)
        @genre = genre
    end 

    def genre
        @genre
    end 

    def self.find_by_name(song_name)
        self.all.find {|song| song.name == song_name}
    end 

    def self.find_or_create_by_name(name)
        if self.find_by_name(name) == nil
            self.create(name)
        else
            self.find_by_name(name)
        end
    end   

    def self.new_from_filename(filename)
        song = Song.new(filename.split(" - ")[1])
        song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp ".mp3")
        song
    end 

    def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
        new_song.save
    end 

end 
