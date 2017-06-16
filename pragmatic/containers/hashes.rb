h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine'}

puts h.length
h['dog']
h['cow'] = 'bovine'
puts h

class SongListContainer
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
        if key.kind_of?(Integer)
            @songs[key]
        else
            #...this is implemented in iterators
        end
    end
    
end

require 'test/unit'
require '../classes/song'

class TestSongListContainer < Test::Unit::TestCase
    def setup
        @list = SongListContainer.new
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
end
