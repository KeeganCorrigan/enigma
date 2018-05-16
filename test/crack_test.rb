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

  def test_brute_force_method
    encrypted_message = "14iv8iyaais"
    crack = Crack.new(encrypted_message)
    assert_equal "hello ..end..", crack.brute_force(encrypted_message)
  end
end
