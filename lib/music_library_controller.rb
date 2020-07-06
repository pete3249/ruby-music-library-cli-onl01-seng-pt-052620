class MusicLibraryController
    attr_accessor :path

    def initialize(path = './db/mp3s')
        new_object = MusicImporter.new(path)
        new_object.import
    end 

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        user_input = gets.chomp

        if user_input != "exit"
            self.call
        end 

    end 

    def list_songs
        sorted_songs = Song.all.sort! {|a, b| a.name <=> b.name}
        sorted_songs.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end 

    def list_artists
        sorted_artists = Artist.all.sort! {|a, b| a.name <=> b.name}
        sorted_artists.each.with_index(1) {|artist, index| puts "#{index}. #{artist.name}"}
    end 

    def list_genres
        sorted_genres = Genre.all.sort! {|a, b| a.name <=> b.name}
        sorted_genres.each.with_index(1) {|genre, index| puts "#{index}. #{genre.name}"}
    end 

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.chomp
        selected_songs = Song.all.select {|song| song.artist.name == user_input}
        sorted_songs = selected_songs.sort! {|a, b| a.name <=> b.name}
        sorted_songs.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets.chomp
        selected_genres = Song.all.select {|song| song.genre.name == user_input}
        sorted_genres = selected_genres.sort! {|a, b| a.name <=> b.name}
        sorted_genres.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
    end 

    def play_song
        puts "Which song number would you like to play?"
        list_songs
        user_input = gets.chomp
        if user_input.to_i > 1 && user_input.to_i <= Song.all.size
            sorted_songs = Song.all.sort! {|a, b| a.name <=> b.name}
            selected_song = sorted_songs[user_input]
            puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
        end 
    end
  

end 
