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
    assert_equal String, e.generate_key.class
  end

  def test_rotate_works_on_key
    e = Enigma.new
    assert_equal 5, e.generate_key.length
    assert_equal String, e.generate_key.class
  end

end
