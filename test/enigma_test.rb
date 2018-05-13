require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test
  def test_it_exists
    e = Enigma.new("theend")
    assert_instance_of(Enigma, e)
  end

  def test_enigma_accepts_input_key
    e = Enigma.new("theend", "12345")
    assert_equal 5, e.key.length
    assert_equal String, e.key.class
    assert_equal "12345", e.key
  end

  def test_char_map_contains_alphabet
    e = Enigma.new("theend", "12345")
    assert_equal false, e.char_map.include?('!')
    assert_equal true, e.char_map.include?('8')
    assert_equal false, e.char_map.include?('arp')
  end

  def test_message_index_is_empty
    e = Enigma.new("theend", "12345")
    assert_equal true, e.message_index.empty?
  end

  def test_enigma_generates_key_if_no_user_input
    e = Enigma.new("theend")
    assert_equal 5, e.key.length
    assert_equal String, e.key.class
  end


  def test_encrypt_returns_encrypted_message
    e = Enigma.new("yarr", "12345")
    expected_message = "cat"
    assert_equal expected_message, e.encrypt
  end
end
  # def test_finds_single_char_index_in_char_map
  #   skip
  #   e = Enigma.new("b", "12345")
  #   cipher = [14, 4]
  #
  #   actual = e.find_message_in_char_map(message, cipher)
  #   assert_equal [1], actual
  #   refute_equal [2], actual
  # end
  #
  # def test_finds_two_char_index_in_char_map
  #   skip
  #   e = Enigma.new("theend", "12345")
  #   shifted_array = [14, 4]
  #   message = "af"
  #
  #   actual = e.find_message_in_char_map(message, cipher)
  #   assert_equal [0, 5], actual
  #   refute_equal [3, 8], actual
  # end
  #
  # def test_shifts_message_index
  #   skip
  #   e = Enigma.new("theend", "12345")
  #   shifted_array = [14, 4]
  #   message = "af"
  #
  #   assert_equal [14, 9], e.shift_message_index([0, 5], [14, 4])
  # end
  #
  # def test_assigns_new_letter_based_on_char_map_index
  #   skip
  #   e = Enigma.new("theend", "12345")
  #   message_char_map_indexes = [14, 9]
  #
  #   assert_equal "ni", e.encrypt(message_char_map_indexes)
  # end
