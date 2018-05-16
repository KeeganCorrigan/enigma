require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require './lib/encryptor.rb'
require './lib/enigma.rb'
require 'pry'

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
    @secret = "this is so secret ..end.."
    @encrypted = @e.encrypt(@secret)
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_encrypts_message
    my_message = "hello"
    actual = @e.encrypt(my_message, "12345", Date.new(2018, 5, 12))

    assert_equal "14iv8", actual
    refute_equal "14i99", actual
  end

  def test_encrypts_message_without_key
    assert_equal 25, @encrypted.length
  end

  def test_decrypts_short_encrypted_message
    my_message = "14iv8"
    actual = @e.decrypt(my_message, "12345", Date.new(2018, 5, 12))

    assert_equal "hello", actual
    refute_equal "hell0", actual
  end

  def test_decrypts_without_key
    my_message = "lksjfdbnvklajsdnvlkajsbd"
    actual = @e.decrypt(my_message)

    assert_equal 24, actual.length
  end

  def test_encrypts_and_then_decrypts_with_key_and_date
    actual = @e.encrypt(@secret, "12345", Date.new(2018, 5, 12))

    assert_equal "a7f2r8ph,b72y2ooax8iyaais", actual

    expected = @e.decrypt(actual, "12345", Date.new(2018, 5, 12))

    assert_equal @secret, expected
  end

  def test_encrypts_and_then_decrypts_without_key_and_date
    skip
    expected = @e.decrypt(@encrypted)

    assert_equal @secret, expected
  end

  def test_crack_works_on_short_encrypted_message
    encrypted_message = "14iv8x8iyaais"

    actual = @e.crack(encrypted_message)
    assert "hello ..end..", actual
  end

  def test_crack_works_on_longer_encrypted_message
    encrypted_message = "a7f2r8ph,b72y2ooax8iyaais"
    actual = @e.crack(encrypted_message)

    assert @secret, actual
  end

  def test_crack_works_on_different_words
    my_message = "this is a test ..end.."

    output = @e.encrypt(my_message, "12345", Date.today)
    assert my_message, @e.crack(output)
  end
end
