require_relative 'encryptor.rb'

class Key
  def generate_key
    key = ''
    5.times do
      key << rand(0..9).to_s
    end
    key
  end
end
