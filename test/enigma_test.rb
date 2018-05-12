require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new
    assert_instance_of(Enigma, e)
  end

  def test_generates_key
    e = Enigma.new
    assert_equal 5, e.generate_key.length
    assert_equal String, e.generate_key.class
  end

  def test_enigma_accepts_input_key
    e = Enigma.new("12345")
    assert_equal 5, e.generate_key.length
    assert_equal String, e.generate_key.class
  end

  def test_rotate_works_on_a_key
    e = Enigma.new
    assert_equal [[1,2],[2,3],[3, 4], [4, 5]], e.rotater("12345")
  end

  def test_generate_offset
    e = Enigma.new
    assert_equal 4, e.time_used_for_offset.length
    assert_equal Array, e.time_used_for_offset.class
  end

  def test_generate_shift_array
    e = Enigma.new("12345")
    e.rotater("12345")
    assert_equal [15, 28, 36, 49], e.generate_shift_array
  end
end
