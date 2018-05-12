require 'pry'

class Enigma

  attr_reader :key
              :message_to_encrypt
              :rotated_array

  def initialize(message_to_encrypt = "", key = generate_key)
    @key = nil
    @rotated_array = []
  end

  def generate_key
    if key == nil
      key = ""
      5.times do
        key << rand(0..9).to_s
      end
    end
    return key
  end

  def rotater(key)
    x = -1
    4.times do
      x += 1
      @rotated_array << (key[0 + x] + key[1 + x]).split('').map do |number|
        number.to_i
      end
    end
    return @rotated_array
  end

  def time_used_for_offset
    time = Time.now.strftime("%m%d%y")
    offset = (time.to_i ** 2).to_s.split(//).last(4).join
    return offset.each_char.map(&:to_i)
  end

  def generate_shift_array
    shifted_array = []
    x = -1
    4.times do
      binding.pry
      x += 1
      shifted_array << @rotated_array[x].flatten.join.to_i + time_used_for_offset[x]
    end
    return shifted_array
  end
end
