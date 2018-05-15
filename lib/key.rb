require_relative 'encryptor.rb'

class Key
  def generate_key
    key = ''
    key << rand(10000..99999).to_s
  end
end
