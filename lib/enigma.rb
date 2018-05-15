require_relative 'encryptor.rb'
require_relative 'crack.rb'

class Enigma
  attr_reader :key,
              :date

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def encrypt(my_message, key = nil, date = nil)
    encryptor = Encryptor.new(my_message, key, date)
    output = encryptor.encrypt
    @key = encryptor.key
    binding.pry
    @date = encryptor.date
    output
  end

  def decrypt(my_message, key = nil , date = nil)
    encryptor = Encryptor.new(my_message, key, date)
    output = encryptor.decrypt
    @key = encryptor.key
    @date = encryptor.date
    output
  end

  def crack(encrypted_message, date = nil)
    operator = :+
    cracked_key = Crack.new(encrypted_message).cracker(encrypted_message)
    encryptor = Encryptor.new
    reversed = encrypted_message.reverse
    reversed_message_index_array = encryptor.find_message_index_in_char_map(reversed)
    decrypted_message = encryptor.rotate_text_to_encrypt_and_decrypt(reversed_message_index_array, cracked_key.reverse, operator)
    decrypted_message.reverse
  end
end
