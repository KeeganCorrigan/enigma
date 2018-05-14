require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/encryptor.rb'

class OffSetCalculatorTest < Minitest::Test
  def test_offset_calculator_rotater_works_on_a_key
    e = Encryptor.new("yarr", "12345", Date.new(2018, 5, 12))
    o = OffSetCalculator.new
    assert_equal [[1,2],[2,3],[3, 4], [4, 5]], o.rotater(e.key)
  end

  def test_generate_offset
    e = Encryptor.new("yarr", "12345", Date.new(2018, 5, 12))
    o = OffSetCalculator.new
    assert_equal 4, o.cipher_offset_time(Date.new(2018, 5, 12)).length
    assert_equal Array, o.cipher_offset_time(Date.new(2018, 5, 12)).class
    assert_equal [8, 3, 2, 4], o.cipher_offset_time(Date.new(2018, 5, 12))
  end

  def test_cipher
    e = Encryptor.new("yarr", "12345", Date.new(2018, 5, 12))
    o = OffSetCalculator.new
    assert_equal [20, 26, 36, 49], o.create_cipher(e.key, Date.new(2018, 5, 12))
  end

  def test_format_date
    e = Encryptor.new("yarr", "12345", "2018-05-13")
    time = "2018-05-13"
    o = OffSetCalculator.new
    assert_equal [8, 3, 2, 4], o.cipher_offset_time(time)
  end

  def test_format_date_works_with_initialized_date
    e = Encryptor.new("yarr", "12345")
    time = "2018-05-13"
    o = OffSetCalculator.new
    assert_equal [8, 3, 2, 4], o.format_date(time)
  end

end
