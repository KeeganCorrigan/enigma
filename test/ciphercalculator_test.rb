require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/encryptor.rb'

class CipherCalculatorTest < Minitest::Test
  def test_offset_calculator_key_rotater
    e = Encryptor.new('yarr', '12345', Date.new(2018, 5, 12))
    o = CipherCalculator.new
    assert_equal %w[12 23 34 45], o.key_rotater(e.key)
  end

  def test_offset_calculator_key_rotater_works_on_longer_key
    e = Encryptor.new('yarr', '12345678', Date.new(2018, 5, 12))
    o = CipherCalculator.new
    assert_equal %w[12 23 34 45], o.key_rotater(e.key)
  end

  def test_generate_date_offset_for_cipher
    o = CipherCalculator.new
    actual = o.offset_date_for_cipher(Date.today)
    assert_equal 4, actual.length
    assert_equal Array, actual.class
    assert_equal [8, 3, 2, 4], o.offset_date_for_cipher(Date.new(2018, 5, 12))
  end

  def test_create_cipher_works_with_encryptor
    e = Encryptor.new('yarr', '12345', Date.new(2018, 5, 12))
    o = CipherCalculator.new
    assert_equal [20, 26, 36, 49], o.create_cipher(e.key, Date.new(2018, 5, 12))
  end

  def test_create_cipher_for_different_key
    o = CipherCalculator.new
    assert_equal [84, 68, 56, 49], o.create_cipher('76545', Date.new(2018, 5, 12))
  end
end
