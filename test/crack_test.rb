require_relative 'test_helper'
require './lib/crack.rb'
require './lib/encryptor.rb'

class CrackTest < Minitest::Test

  def test_it_exists
    crack = Crack.new("..end..", Date.new(2018, 5, 12))
    assert_instance_of(Crack, crack)
  end



end
