require_relative 'enigma.rb'

class Key
  def generate_key
    key = ""
    5.times do
      key << rand(0..9).to_s
    end
    return key
  end
end
