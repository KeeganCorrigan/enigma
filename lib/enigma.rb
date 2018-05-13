require_relative 'encryptor.rb'
require_relative 'crack.rb'

class Enigma

  def encrypt(my_message, key = nil, date = nil)
    encryptor = Encryptor.new(my_message, key, date)
    encryptor.encrypt
  end

  def decrypt(my_message, key = nil, date = nil)
    encryptor = Encryptor.new(my_message, key, date)
    encryptor.decrypt
  end

  def crack(encrypted_message, date)
    operator = :+
    cracked_key = Crack.new(encrypted_message).cracker(encrypted_message)
    encryptor = Encryptor.new(encrypted_message)
    reversed = encrypted_message.reverse
    reversed_message_index_array = encryptor.find_message_in_char_map(reversed)
    decrypted_message = encryptor.rotater(reversed_message_index_array, cracked_key.reverse, operator)
    return decrypted_message.reverse
  end

end
