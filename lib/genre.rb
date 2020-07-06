require 'pry'

class Genre
    extend Concerns::Findable
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
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
        new_genre = Genre.new(name)
        new_genre.save
        new_genre
    end 

    def songs
        Song.all.select{|song| song.genre = self}
    end 

    def artists
        self.songs.collect {|song| song.artist}.uniq
    end 

end 