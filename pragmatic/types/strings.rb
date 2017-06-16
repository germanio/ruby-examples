require '../iterators/jukebox'

class TestStrings < Test::Unit::TestCase
    def setup
        @source = [
            "/jazz/j00132.mp3  | 3:45 | Fats     Waller     | Ain't Misbehavin'",
            "/jazz/j00319.mp3  | 2:58 | Louis    Armstrong  | Wonderful World",
            "/bgrass/bg0732.mp3| 4:09 | Strength in Numbers | Texas Red"
        ]
        @songs = SongList.new
    end
    
    def test_string_split
        @source.each do |line|
            file, length, name, title = line.chomp.split(/\s*\|\s*/)
            @songs.append(Song.new(title, name, length))
        end
        assert_equal('Wonderful World', @songs[1].name)
    end
    
    def test_string_squeeze
        @source.each do |line|
            file, length, name, title = line.chomp.split(/\s*\|\s*/)
            name.squeeze!(' ')
            @songs.append(Song.new(title, name, length))
        end
        assert_equal('Fats Waller', @songs[0].artist)
    end
    
    def test_string_scan
        @source.each do |line|
            file, length, name, title = line.chomp.split(/\s*\|\s*/)
            mins, secs = length.scan(/\d+/)
            @songs.append(Song.new(title, name, mins.to_i*60 + secs.to_i))
        end
        assert_equal(178, @songs[1].duration) # 2 min 58 secs
    end
end