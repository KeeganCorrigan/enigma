require_relative 'key.rb'
require_relative 'OffSetCalculator.rb'
require 'date'

class Enigma
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
    cipher = OffSetCalculator.new.cipher(key, time)
    message_index = find_message_in_char_map(message)
    shift_index_amount = shift_message_index(message_index, cipher)
    encrypted_message = rotater(shift_index_amount)
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

  def shift_message_index(message_index, shifted_array)
    shift_index_amount = []
    x = 0
    message_index.map do |number|
      if x > 3
        x = 0
      end
      shift_index_amount << (number + shifted_array[x])
      x += 1
    end
    return shift_index_amount
  end

  def rotater(shift_index_amount)
    shift_index_amount.map { |index| @char_map[(index % @char_map.length)] }.join
  end
end
