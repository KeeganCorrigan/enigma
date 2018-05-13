require_relative 'encryptor.rb'

class Enigma

  def encrypt(my_message, key = nil, date = nil)
    encryptor = Encryptor.new(my_message, key, date)
    encryptor.encrypt
  end

end
