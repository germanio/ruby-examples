require 'test/unit'

class TestRegExp < Test::Unit::TestCase
    def setup
        re = /(\d+):(\d+)/
        @md = re.match('Time is: 11:45am')
    end
    
    def test_regexp_class
        assert_equal(MatchData, @md.class)
    end
    
    def test_regexp_parts
        assert_equal('11:45', @md[0])
        assert_equal('11', @md[1])
        assert_equal('45', @md[2])
    end
    
    def test_regexp_pre
        assert_equal('Time is: ', @md.pre_match)
    end
    
    def test_regexp_post
        assert_equal('am', @md.post_match)
    end
end
