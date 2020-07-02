class Song

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
    end 

    def save
        @@all << self
    end 

    def self.create(name)
        created_song = Song.new(name)
        created_song.save
        created_song
    end 

    def self.all
        @@all
    end 

    def self.destroy_all
        @@all.clear
    end 

end 