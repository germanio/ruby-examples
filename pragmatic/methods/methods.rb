require 'test/unit'

class MethodContainer
    def methodWithDefaultParamValues(name='John', surname='Doe')
        "#{name} #{surname}"
    end
    
    def expandedArray(first, second, third)
        "#{first} #{second} #{third}"
    end
    
    def variableArguments(first, *otherArgs)
        "#{first} and #{otherArgs.join(', ')}"
    end
    
    def useOfBlock(arg1)
        if block_given?
            return yield(arg1)
        else
            return arg1
        end
    end
end

class TaxCalculator
    def initialize(name, &block)
        @name, @block = name, block
    end
    
    def getTax(amount)
        "#{@name} on #{amount}: #{ @block.call(amount) }"
    end
end

class TestMethods < Test::Unit::TestCase
    def setup
        @container = MethodContainer.new()
    end
    
    def test_defaultParameters
        text = @container.methodWithDefaultParamValues()
        assert_equal('John Doe', text)
    end
    
    def test_onlyOneDefaultParam
        text = @container.methodWithDefaultParamValues('Germán')
        assert_equal('Germán Doe', text)
    end
    
    def test_expandedArray
        text = @container.expandedArray(*['uno', 'dos', 'tres'])
        assert_equal('uno dos tres', text)
    end
    
    def test_variableArguments
        text = @container.variableArguments('first', 'second', 'much', 'more')
        assert_equal('first and second, much, more', text)
    end
    
    def test_blockInMethod
        text = @container.useOfBlock(1) { |num| 'the result is: ' + (num + 10).to_s }
        assert_equal('the result is: 11', text)
    end
    
    def test_noBlockInMethod
        text = @container.useOfBlock(1)
        assert_equal(1, text)
    end
    
    def test_blockAsArgument
        calculator = TaxCalculator.new('IVA') { |amount| amount * 0.21 }
        text = calculator.getTax(100)
        assert_equal('IVA on 100: 21.0', text)
    end
end
    