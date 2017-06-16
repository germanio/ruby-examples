require '../iterators/jukebox'
require 'test/unit'

class WordIndex
    def initialize
        @index = Hash.new(nil)
    end
    def index(anObject, *phrases)
        phrases.each do |aPhrase|
            aPhrase.scan /\w[-\w']+/ do |aWord|
                aWord.downcase!
                @index[aWord] = [] if @index[aWord].nil?
                @index[aWord].push(anObject)
            end
        end
    end
    def lookup(aWord)
        @index[aWord.downcase]
    end
end

class SearchableSongList < SongList
    def initialize
        super()
        @index = WordIndex.new
    end
    
    def append(aSong)
        @songs.push(aSong)
        @index.index(aSong, aSong.name, aSong.artist)
        self
    end
    
    def lookup(aWord)
        @index.lookup(aWord)
    end
end

class TestSearchableSongList < Test::Unit::TestCase
    def setup
        @source = [
            "/jazz/j00132.mp3  | 3:45 | Fats     Waller     | Ain't Misbehavin'",
            "/jazz/j00319.mp3  | 2:58 | Louis    Armstrong  | Wonderful World",
            "/bgrass/bg0732.mp3| 4:09 | Strength in Numbers | Texas Red"
        ]
        @songs = SearchableSongList.new
    end
    
    def test_indexing
        @source.each do |line|
            file, length, name, title = line.chomp.split(/\s*\|\s*/)
            name.squeeze!(' ')
            mins, secs = length.scan(/\d+/)
            @songs.append(Song.new(title, name, mins.to_i*60 + secs.to_i))
        end
        assert_equal('Fats Waller', @songs.lookup('Fats')[0].artist)
        assert_equal('Wonderful World', @songs.lookup('WOrlD')[0].name)
    end
end
