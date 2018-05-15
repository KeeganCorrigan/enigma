require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/encryptor.rb'

class CipherCalculatorTest < Minitest::Test
  def test_offset_calculator_key_rotater_works_on_a_key
    e = Encryptor.new("yarr", "12345", Date.new(2018, 5, 12))
    o = CipherCalculator.new
    assert_equal ["12", "23", "34", "45"], o.key_rotater(e.key)
  end

  def test_generate_date_offset_for_cipher
    e = Encryptor.new("yarr", "12345", Date.new(2018, 5, 12))
    o = CipherCalculator.new
    assert_equal 4, o.offset_date_for_cipher(Date.new(2018, 5, 12)).length
    assert_equal Array, o.offset_date_for_cipher(Date.new(2018, 5, 12)).class
    assert_equal [8, 3, 2, 4], o.offset_date_for_cipher(Date.new(2018, 5, 12))
  end

  def test_create_cipher
    e = Encryptor.new("yarr", "12345", Date.new(2018, 5, 12))
    o = CipherCalculator.new
    assert_equal [20, 26, 36, 49], o.create_cipher(e.key, Date.new(2018, 5, 12))
  end
end
