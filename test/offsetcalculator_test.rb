require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/rotater.rb'

class OffSetCalculatorTest < Minitest::Test
  def test_rotater_accepts_key
    e = Enigma.new("yarr", "12345")
    binding.pry
    o = OffSetCalculator.new
    assert_equal [[1,2],[2,3],[3, 4], [4, 5]], r.rotater(e.key)
  end
  #
  # def test_rotate_works_on_a_key
  #   e = Enigma.new
  #   assert_equal [[1,2],[2,3],[3, 4], [4, 5]], e.rotater("12345")
  # end


end
