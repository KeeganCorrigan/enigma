require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/encryptor.rb'

class EncryptorTest < Minitest::Test

  def setup
    @all_attributes  = Encryptor.new("hello", "12345", Date.new(2018, 5, 12))
    @message_and_key = Encryptor.new("hello", "12345")
    @just_message    = Encryptor.new("hello")
  end

  def test_it_exists
    assert_instance_of(Encryptor, @all_attributes)
  end

  def test_encryptor_accepts_input_key
    assert_equal 5, @all_attributes.key.length
    assert_equal "12345", @all_attributes.key
  end

  def test_encryptor_accepts_message
    assert_equal "hello", @all_attributes.message
  end

  def test_encryptor_creates_key_if_none_entered
    assert @just_message.key
    assert_equal 5, @just_message.key.length
  end

  def test_encryptor_creates_date_if_none_entered
    assert @message_and_key.date
    assert_equal Date.today, @message_and_key.date
  end

  def test_char_map
    refute @all_attributes.char_map.include?('!')
    assert @all_attributes.char_map.include?('8')
    assert_equal 39, @all_attributes.char_map.length
  end

  def test_char_map_chars_all_lengths_one
    @all_attributes.char_map.each do |char|
      assert char.length == 1
    end
  end

  def test_encryptor_generates_key_if_no_user_input
    assert_equal 5, @all_attributes.key.length
    assert_equal String, @all_attributes.key.class
  end

  def test_find_message_index_in_char_map
    e = Encryptor.new("abcdef")
    assert_equal [0,1,2,3,4,5], e.find_message_index_in_char_map(e.message)
  end

  def test_message_index_is_correct
    actual = @all_attributes.find_message_index_in_char_map(@all_attributes.message)

    assert_equal [7, 4, 11, 11, 14], actual
    refute_equal [6, 14, 24, 78, 101], actual
  end

  def test_rotate_text_to_encrypt_and_decrypt
    message_index = [7, 4, 11, 11, 14]
    cipher = [20, 26, 36, 49]
    operator = :+

    assert_equal "14iv8", @all_attributes.rotate_text_to_encrypt_and_decrypt(message_index, cipher, operator)
  end

  def test_date_can_be_entered_as_a_string
    e = Encryptor.new("hello", "12345", "2018-05-13")
    assert_equal "2018-05-13", e.date
  end

  def test_reverse_rotator
    message_index = [27, 30, 8, 21, 34]
    cipher = [20, 26, 36, 49]
    operator = :-

    assert_equal "hello", @all_attributes.rotate_text_to_encrypt_and_decrypt(message_index, cipher, operator)
  end
end
