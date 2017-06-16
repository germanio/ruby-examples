require 'test/unit'

class BikeTire
    def initialize(tireLength)
        @tireLength = tireLength
    end
    
    def radius
        @tireLength / (Math::PI * 2)
    end
end

class TestBikeTire < Test::Unit::TestCase
    def setup
        length = Math::PI * 2
        @tire = BikeTire.new(length)
    end
    
    def test_radius_one
        assert_equal(1, @tire.radius)
    end
    
    def test_radius_zero
        @tire = BikeTire.new(0)
        assert_equal(0, @tire.radius)
    end
end