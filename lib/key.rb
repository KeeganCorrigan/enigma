require './lib/encryptor.rb'

class Key
  def generate_key
    key = ''
    5.times do
      key << ('0'..'9').to_a.sample
    end
    key
  end
end
