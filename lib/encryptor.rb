require_relative 'key.rb'
require_relative 'offsetcalculator.rb'
require 'date'

class Encryptor
  attr_reader   :key,
                :char_map,
                :message_index,
                :message,
                :time

  def initialize(message, key = nil, time = nil)
    @time = time || Date.today
    @key = key || Key.new.generate_key
    @char_map = (('a'..'z').to_a + ('0'..'9').to_a).push(' ', '.', ',')
    @message = message
  end

  def encrypt
    cipher = OffSetCalculator.new.create_cipher(key, time)
    message_index = find_message_in_char_map(message)
    encrypted_message = rotater(message_index, cipher)
    return encrypted_message
  end

  def find_message_in_char_map(message)
    message_index = []
    message_array = message.chars
    message_array.each do |letter|
      message_index << @char_map.each_index.select do |index|
        @char_map[index] == letter
      end
    end
    return message_index.flatten
  end

  def rotater(message_index, cipher)
    encrypted_message = []
    x = 0
    message_index.map do |number|
      if x > 3
        x = 0
      end
      encrypted_message << @char_map[(number + cipher[x]) % 39]
      x += 1
    end
    return encrypted_message.join
  end
end
