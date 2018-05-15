require_relative 'test_helper'
require './lib/crack.rb'
require './lib/encryptor.rb'

class CrackTest < Minitest::Test

  def test_crack_exists
    crack = Crack.new("..end..", Date.new(2018, 5, 12))
    assert_instance_of(Crack, crack)
  end

  def test_crack_accepts_message
    crack = Crack.new("..end..", Date.new(2018, 5, 12))
    assert_equal "..end..", crack.encrypted_message
  end

  def test_crack_accepts_date
    crack = Crack.new("..end..", Date.new(2018, 5, 12))
    assert_instance_of Date, crack.date
  end

  def test_crack_does_not_require_date
    crack = Crack.new("..end..")
    assert_instance_of Date, crack.date
  end

  def test_get_last_chars_of_cipher_text
    encrypted_message = "14iv8x8iyaais"
    crack = Crack.new(encrypted_message)
    assert_equal ["8", "i", "y", "a", "a", "i", "s"], crack.get_last_chars(encrypted_message)
  end

  def test_get_index_0_and_4_of_get_last_chars
    crack = Crack.new("14iv8x8iyaais")
    get_last_chars = ["8", "i", "y", "a", "a", "i", "s"]
    assert_equal ["8", "a"], crack.create_array_for_character_comparison_for_cracking(get_last_chars)
  end

  def test_get_position_char_pairs_in_char_map
    crack = Crack.new("14iv8x8iyaais")
    char_pair = ["8", "a"]
    assert_equal [34, 0], crack.encrypted_char_index
  end

  def test_get_positions_of_cracking_comparison_in_template
    crack = Crack.new("14iv8x8iyaais")
    template = [".", ".", "e", "n", "d", ".", "."]
    assert_equal [37, 13], crack.find_cracked_key_tail
  end

  def test_reverse_rotation_of_index_pair_until_template_index_match
    crack = Crack.new("14iv8x8iyaais")
    encrypted_message = ["8", "a"]
    assert_equal 36, rotate_until_decrypted(encrypted_message)
  end
end


  # def test_finds_rotated_index_of_one_letter
  #   skip
  #   encrypted_message = "h"
  #   crack = Crack.new(encrypted_message, Date.new(2018, 5, 12))
  #   assert_equal [6], crack.cracker(encrypted_message)
  # end
  #
  # def test_finds_rotated_index_of_multiple_letters
  #   skip
  #   encrypted_message = "14iv8iyaais"
  #   crack = Crack.new(encrypted_message, Date.new(2018, 5, 12))
  #   assert_equal [13, 3, 29, 19], crack.cracker(encrypted_message)
  # end
