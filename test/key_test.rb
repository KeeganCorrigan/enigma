require 'pry'
gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/key.rb'

class KeyTest < Minitest::Test

  def test_it_exists
    k = Key.new
    assert_instance_of(Key, k)
  end

  def test_generates_key
    k = Key.new
    k.generate_key
    assert_equal 5, k.generate_key.length
    assert_equal String, k.generate_key.class
  end

  def test_it_does_not_generate_key_when_key_is_entered
    e = Enigma.new
    e.encrypt("top secret ..end..", "12345", Date.new(2018, 5, 12))
    
end
