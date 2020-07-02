class Artist

    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end 

    def save
        @@all << self
    end

    def self.create(name)
        created_artist = Artist.new(name)
        created_artist.save
        created_artist
    end 

    def self.all
        @@all
    end 

    def self.destroy_all
        @@all.clear
    end 

end 