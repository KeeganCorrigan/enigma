require 'pry'

class Enigma
  def initialize

  end

  def generate_key
    key = []
    5.times do
    key.join << rand(0..9)
    end
  end
end
