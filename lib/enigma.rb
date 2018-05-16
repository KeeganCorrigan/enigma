require_relative 'encryptor.rb'
require_relative 'cracker.rb'

class Enigma
  attr_reader :key,
              :date,
              :cracked_key

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
    @cracked_key = nil
  end

  def encrypt(my_message, key = nil, date = nil)
    encryptor = Encryptor.new(my_message, key, date)
    cipher_text = encryptor.encrypt
    @key = encryptor.key
    @date = encryptor.date
    cipher_text
  end

  def decrypt(my_message, key = nil , date = nil)
    encryptor = Encryptor.new(my_message, key, date)
    plain_text = encryptor.decrypt
    @key = encryptor.key
    @date = encryptor.date
    plain_text
  end

  def crack(encrypted_message, date = nil)
    operator = :-
    crack = Cracker.new(encrypted_message)
    cracked = crack.cracker(encrypted_message)
    @cracked_key = crack.brute_force_encryption_key(encrypted_message)
    encryptor = Encryptor.new
    reversed_cipher_text = encrypted_message.reverse
    reversed_message_index = encryptor.find_message_index_in_char_map(reversed_cipher_text)
    cracked_message = encryptor.rotate_text_to_encrypt_and_decrypt(reversed_message_index, cracked.reverse, operator)
    cracked_message.reverse
  end
end
