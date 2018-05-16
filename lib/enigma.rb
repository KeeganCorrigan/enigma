require_relative 'encryptor.rb'
require_relative 'crack.rb'

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
    output = encryptor.encrypt
    @key = encryptor.key
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
    operator = :-
    crack = Crack.new(encrypted_message)
    cracked = crack.cracker(encrypted_message)
    @cracked_key = crack.brute_force(encrypted_message)
    encryptor = Encryptor.new
    reversed = encrypted_message.reverse
    reversed_message_index_array = encryptor.find_message_index_in_char_map(reversed)
    cracked_message = encryptor.rotate_text_to_encrypt_and_decrypt(reversed_message_index_array, cracked.reverse, operator)
    cracked_message.reverse
  end
end

# require './lib/enigma.rb'
# e = Enigma.new
