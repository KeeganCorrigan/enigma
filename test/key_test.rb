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
    assert_equal 5, k.key.length
    assert_equal String, k.key.class
  end
end
