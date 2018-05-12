require 'pry'

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new
    assert_instance_of(Enigma, e)
  end

  def test_it_generates_key
    e = Enigma.new
    assert_equal 5, e.generate_key.length
    assert_equal Array, e.generate_key.class
  end

  def test_rotate_a_works_on_key
    e = Enigma.new
    assert_equal ["1","2"], e.rotate_a("12345")
  end

  def test_rotate_b_works_on_key
    e = Enigma.new
    assert_equal "23", e.rotate_b("12345")
  end

  def test_rotate_c_works_on_key
    e = Enigma.new
    assert_equal "34", e.rotate_c("12345")
  end

  def test_rotate_d_works_on_key
    e = Enigma.new
    assert_equal "45", e.rotate_d("12345")
  end

  def test_generate_offset
    e = Enigma.new
    time = Time.now.strftime("%m%d%y")
    offset = (time.to_i ** 2).to_s.split(//).last(4).join
    expected = offset.each_char.map(&:to_i)
    assert_equal expected, e.time_used_for_offset
    assert_equal 4, e.time_used_for_offset.length
    assert_equal Array, e.time_used_for_offset.class
  end
  #
  # def test_rotate_offset_a
  #   e = Enigma.new
  #   assert_equal 21, e.rotate_a("12345").split('').to_i + e.time_used_for_offset
  # end
end
