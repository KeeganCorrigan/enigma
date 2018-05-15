require_relative 'test_helper'
gem 'minitest', '~> 5.2'
require './lib/encryptor.rb'
require './lib/enigma.rb'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_enigma_gets_encrypted_message
    e = Enigma.new
    my_message = "hello"
    actual = e.encrypt(my_message, "12345", Date.new(2018, 5, 12))
    assert_equal "14iv8", actual
    refute_equal "14i99", actual
  end

  def test_gets_encrypted_message_without_key
    e = Enigma.new
    my_message = "this is so secret ..end.."
    actual = e.encrypt(my_message)
    assert_equal 25, actual.length
    assert_equal String, actual.class
  end

  def test_gets_encrypted_message
    e = Enigma.new
    my_message = "14iv8"
    actual = e.decrypt(my_message, "12345", Date.new(2018, 5, 12))
    assert_equal "hello", actual
    refute_equal "hell0", actual
  end

  def test_gets_encrypted_message_without_key
    e = Enigma.new
    my_message = "lksjfdbnvklajsdnvlkajsbd"
    actual = e.decrypt(my_message)
    assert_equal 24, actual.length
    assert_equal String, actual.class
  end

  def test_encrypts_and_decrypts
    e = Enigma.new
    my_message = "this is so secret ..end.."
    actual = e.encrypt(my_message, "12345", Date.new(2018, 5, 12))
    assert_equal "a7f2r8ph,b72y2ooax8iyaais", actual
    expected = e.decrypt(actual, "12345", Date.new(2018, 5, 12))
    assert_equal "this is so secret ..end..", expected
  end

  def test_crack_works_on_short_encrypted_message
    e = Enigma.new
    encrypted_message = "14iv8x8iyaais"
    actual = e.crack(encrypted_message)
    assert "hello ..end..", actual
  end

  def test_crack_works_on_longer_encrypted_message
    e = Enigma.new
    my_message = "this is so secret ..end.."
    encrypted_message = "a7f2r8ph,b72y2ooax8iyaais"
    actual = e.crack(encrypted_message)
    assert my_message, actual
  end

  def test_crack_works_on_different_words
    e = Enigma.new
    my_message = "this is a test ..end.."
    output = e.encrypt(my_message, "12345", Date.today)
    assert my_message, e.crack(output)
  end

  def test_crack_works_without_date_and_key
    e = Enigma.new
    my_message = "this is a test too, phareal ..end.."
    output = e.encrypt(my_message)
    assert my_message, e.crack(output)
  end

  def test_crack_works_without_date_and_key_2
    e = Enigma.new
    my_message = "umq 1fdxrvixl"
    assert_equal "hello ..end..", e.crack(my_message)
  end
end
