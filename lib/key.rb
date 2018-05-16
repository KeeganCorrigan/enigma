require './lib/encryptor.rb'
require 'pry'

class Key
  def generate_key
    key = ''
    5.times do
    key << ('0'..'9').to_a.sample
    end
    return key
  end
end
