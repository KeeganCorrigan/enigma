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

  def test_cracker_finds_cipher_index
    encrypted_message = "14iv8iyaais"
    crack = Crack.new(encrypted_message, Date.new(2018, 5, 12))
    assert_equal [-13, -3, -29, -19], crack.cracker(encrypted_message)
  end

  def test_brute_force_method_returns_key
    encrypted_message = "0sy07llnx1qnr"
    crack = Crack.new(encrypted_message)
    assert_equal "11111", crack.brute_force(encrypted_message)
  end

  def test_brute_force_method_returns_key_on_longer_string
    e = Enigma.new
    message = "this is so secret ..end.."
    output = e.encrypt("this is so secret ..end..", "75849")
    crack = Crack.new(output)
    assert_equal "75849", crack.brute_force(output)
  end

  def test_brute_force_method_works_on_automatically_generated_key
    e = Enigma.new
    message = "this is so secret ..end.."
    output = e.encrypt("this is so secret ..end..")
    crack = Crack.new(output)
    decryption_key = crack.brute_force(output)
    assert_equal "this is so secret ..end..", e.decrypt(output, decryption_key)
  end
end
