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
    
#    def duration=(newDuration)
#        @duration = newDuration
#    end
end

class KaraokeSong < Song
    def initialize(name, artist, duration, lyrics)
        super(name, artist, duration)
        @lyrics = lyrics
    end
    
    def to_s
        super + " #{@lyrics}"
    end
end
    
aSong = Song.new("Virtual Insanity", "Jamiroquai", 150)

puts aSong.duration
puts aSong.duration = 256
puts aSong.duration

anotherSong = KaraokeSong.new("Love foolosophy", "Jamiroquai", 200, "chan chan...")

puts aSong
puts anotherSong

class SongList < Song
    MaxTime = 5*60    # 5 minutes
    
    def SongList.isTooLong (aSong)
        return aSong.duration > MaxTime
    end
end

song1 = Song.new("Virtual Insanity", "Jamiroquai", 150)
puts "Is song1 too long? " + SongList.isTooLong(song1).to_s

song2 = Song.new("Virtual Insanity", "Jamiroquai", 650)
puts "Is song2 too long? " + SongList.isTooLong(song2).to_s