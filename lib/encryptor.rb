require_relative 'key.rb'
require_relative 'ciphercalculator.rb'
require 'Date'

class Encryptor
  attr_reader   :key,
                :char_map,
                :message,
                :date

  def initialize(message = nil, key = nil, date = nil)
    @date = date || Date.today
    @key = key || Key.new.generate_key
    @char_map = (('a'..'z').to_a + ('0'..'9').to_a).push(' ', '.', ',')
    @message = message
  end

  def encrypt
    operator = :+
    cipher = CipherCalculator.new.create_cipher(key, date)
    message_index = find_message_index_in_char_map(message)
    encrypted_message = rotate_text_to_encrypt_and_decrypt(message_index, cipher, operator)
    encrypted_message
  end

  def decrypt
    operator = :-
    cipher = CipherCalculator.new.create_cipher(key, date)
    message_index = find_message_index_in_char_map(message)
    decrypted_message = rotate_text_to_encrypt_and_decrypt(message_index, cipher, operator)
    decrypted_message
  end

  def find_message_index_in_char_map(message)
    message_index = []
    message.chars.each do |letter|
      message_index << @char_map.each_index.select do |index|
        @char_map[index] == letter
      end
    end
    message_index.flatten
  end

  def rotate_text_to_encrypt_and_decrypt(message_index, cipher, operator)
    altered_message = []
    x = 0
    message_index.map do |number|
      x = 0 if x > 3
      altered_message << @char_map[number.public_send(operator, cipher[x]) % @char_map.length]
      x += 1
    end
    altered_message.join
  end
end
