require 'test/unit'
require '../iterators/jukebox'

class Volume
    include Comparable
    
    attr :volume
    
    def initialize(volume) # 0..9
        @volume = volume
    end
    
    def inspect
        '#' * @volume
    end
    
    # support for ranges
    def <=>(other)
        self.volume <=> other.volume
    end
    
    def succ
        raise(IndexError, "Volume too big") if @volume >= 9
        Volume.new(@volume.succ)
    end
end

class TestVolume < Test::Unit::TestCase
    def test_volume_1
        volume = Volume.new(1)
        assert_equal('#', volume.inspect)
    end
    
    def test_volume_5
        volume = Volume.new(5)
        assert_equal('#####', volume.inspect)
    end
end

class TestVolumeRange < Test::Unit::TestCase
    def test_range
        medium = Volume.new(4)..Volume.new(7)
        assert_true(medium.include?(Volume.new(5)))
    end
end

class TestIntervals < Test::Unit::TestCase
    def setup
        @source = [1,2,3,4,5,6,7,8,9]
    end
    
    def test_intervals
        selected = @source.select { |number| (4...7) === number }
        assert_equal(3, selected.length)
        assert_true(selected.include?(5))
    end
end
