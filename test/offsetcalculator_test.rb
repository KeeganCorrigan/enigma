require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/offsetcalculator.rb'

class OffSetCalculatorTest < Minitest::Test
  def test_offset_calculator_rotater_works_on_a_key
    e = Enigma.new("yarr", "12345")
    o = OffSetCalculator.new
    assert_equal [[1,2],[2,3],[3, 4], [4, 5]], o.rotater(e.key)
  end

  def test_generate_offset
    e = Enigma.new("yarr", "12345")
    o = OffSetCalculator.new
    assert_equal 4, o.time_used_for_offset.length
    assert_equal Array, o.time_used_for_offset.class
  end

  def test_cipher
    e = Enigma.new("yarr", "12345")
    o = OffSetCalculator.new
    assert_equal [15, 28, 36, 49], o.cipher(e.key)
  end

end
