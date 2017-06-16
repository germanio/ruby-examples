require 'test/unit'

class Song 
    attr_reader :name, :artist, :duration
    attr_writer :duration
    
    def initialize(name, artist, duration)
        @name = name
        @artist = artist
        @duration = duration
    end
    
    def to_s
        "Song: #{@name} -- #{@artist} (#{@duration})"
    end
end

class SongList
    attr_reader :songs
    
    def initialize
        @songs = Array.new
    end
    
    def append(aSong)
        @songs.push(aSong)
        self
    end
    
    def deleteFirst
        @songs.shift
    end
    
    def deleteLast
        @songs.pop
    end
    
    def [](key)
        
        return @songs[key] if key.kind_of?(Integer)
        return @songs.find { |song| song.name == key }
    end
    
end

class TestSongList < Test::Unit::TestCase
    def setup
        @list = SongList.new
        @list.append(Song.new("Virtual Insanity", "Jamiroquai", 150))
        @list.append(Song.new("Love Foolosophy", "Jamiroquai", 150))
        @list.append(Song.new("Stardust", "Jamiroquai", 150))
    end
    
    def test_add_songs
        assert_equal(3, @list.songs.length)
    end
    
    def test_delete_first
        firstSong = @list.deleteFirst
        assert_equal("Virtual Insanity", firstSong.name)
    end
    
    def test_delete_last
        lastSong = @list.deleteLast
        assert_equal("Stardust", lastSong.name)
    end
    
    def test_index_by_integer
        aSong = @list[1] #Love Foolosophy
        assert_equal("Love Foolosophy", aSong.name)
    end
    
    def test_index_by_name
        aSong = @list['Stardust']
        assert_equal('Stardust', aSong.name)
    end
end
