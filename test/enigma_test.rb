require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
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

  def test_generates_key_only_generates_one_key
    e = Enigma.new
    key_1 = e.generate_key
    key_2 = e.generate_key
    assert_equal(key_1, key_2)
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

  def test_finds_single_char_index_in_char_map
    e = Enigma.new("12345")
    shifted_array = [14, 4]
    message = "b"

    actual = e.find_message_in_char_map(message, shifted_array)
    assert_equal [1], actual
    refute_equal [2], actual
  end

  def test_finds_two_char_index_in_char_map
    e = Enigma.new("12345")
    shifted_array = [14, 4]
    message = "af"

    actual = e.find_message_in_char_map(message, shifted_array)
    assert_equal [0, 5], actual
    refute_equal [3, 8], actual
  end

  def test_shifts_message_index
    e = Enigma.new("12345")
    shifted_array = [14, 4]
    message = "af"

    assert_equal [14, 9], e.shift_message_index([0, 5], [14, 4])
  end

  def test_assigns_new_letter_based_on_char_map_index
    e = Enigma.new("12345")
    message_char_map_indexes = [14, 9]

    assert_equal "ni", e.encrypt(message_char_map_indexes)
  end

end
