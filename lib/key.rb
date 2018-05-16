require './lib/encryptor.rb'

class Key
  def generate_key
    key = ''
    key << rand(10_000..99_999).to_s
  end
end
