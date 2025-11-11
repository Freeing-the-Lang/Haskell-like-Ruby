require_relative '../src/core'
require 'test/unit'

class TestHSR < Test::Unit::TestCase
  def test_map_fold
    i = HSR::Interpreter.new
    assert_nothing_raised { i.eval("print(fold(map([1,2,3], ->(x){x*2}), 0, ->(a,b){a+b}))") }
  end
end
