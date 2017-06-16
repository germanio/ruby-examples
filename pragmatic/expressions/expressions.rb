require 'test/unit'

class Amplifier
    attr_accessor :leftChannel, :rightChannel
    
    def volume=(newVolume)
        self.leftChannel = self.rightChannel = newVolume
    end
end

class OtherAssignment
    def initialize(aString)
        @value = aString
    end
    
    def +(other)
        OtherAssignment.new(self.to_s + ' ' + other.to_s)
    end
    
    def to_s
        @value
    end
end

class TestCommandExpansion < Test::Unit::TestCase
    def test_commandExpansion
        files = `ruby -v`
        assert_equal(0, files =~ /ruby .*/)
    end
    
    def test_assignments
        amp = Amplifier.new()
        amp.leftChannel = amp.rightChannel = 4
        amp.volume = 7
        assert_equal(7, amp.leftChannel)
        assert_equal(7, amp.rightChannel)
    end
    
    def test_paralell_1
        var1 = 1
        var2 = 3
        var1, var2 = var2, var1
        
        assert_equal(3, var1)
        assert_equal(1, var2)
    end
    
    def test_paralell_2
        x = 0
        a, b, c = x, (x += 1), (x += 1)
        assert_equal([0,1,2], [a, b, c])
    end
    
    def test_other_assignment
        myClass = OtherAssignment.new('first')
        myClass += 'second'
        assert_equal('first second', myClass.to_s)
    end
end