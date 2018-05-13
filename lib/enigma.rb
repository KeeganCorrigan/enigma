require_relative 'key.rb'
require_relative 'OffSetCalculator.rb'

class Enigma
  attr_reader :key,
              :message,
              :char_map,
              :message_index

  def initialize(message, key = nil)
    @key = key || Key.new.generate_key
    @char_map = ('a'..'z').to_a + ('0'..'9').to_a
    @message = message
  end

  def encrypt
    cipher = OffSetCalculator.new.cipher(key)
    message_index = find_message_in_char_map(message)
    shift_message_index(message_index, cipher)
    binding.pry
  end

  def find_message_in_char_map(message, cipher)
    message_index = []
    message_array = message.chars
    message_array.each do |letter|
      message_index << @char_map.each_index.select do |index|
        @char_map[index] == letter
      end
    end
    return message_index.flatten!
  end

  def shift_message_index(message_index, shifted_array)
    second_shifted_array = []
    x = 0
    message_index.map do |number|
      if x > 3
        x = 0
      end
      second_shifted_array << (number + shifted_array[x])
      x += 1
    end
    return second_shifted_array
  end
  #
  #
  # def encrypt(new_indexes)
  #   encrypted = new_indexes.map do |index|
  #     @char_map[index - 1]
  #   end
  #   encrypted.join
  # end
end

# def generate_key
#   if @key == ""
#     5.times do
#       @key << rand(0..9).to_s
#     end
#   end
#   return @key
# end
