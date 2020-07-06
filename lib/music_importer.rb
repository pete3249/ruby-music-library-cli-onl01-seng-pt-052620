class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path
    end 

    def files
        imported_files = Dir.entries(@path)
        imported_files.select {|file| file.end_with?("mp3")}
    end 

    def import
       self.files.each {|filename| Song.create_from_filename(filename)}
    end 

end 
