require_relative 'enigma.rb'

class OffSetCalculator
  attr_reader :cipher_array

  def initialize(key)
    @cipher_array = []
  end

  def rotater(key)
    rotated_array = []
    x = -1
    4.times do
      x += 1
      rotated_array << (key[0 + x] + key[1 + x]).split('').map do |number|
        number.to_i
      end
    end
    return rotated_array
  end

  def time_used_for_offset
    time = Time.now.strftime("%m%d%y")
    offset = (time.to_i ** 2).to_s.split(//).last(4).join
    return offset.each_char.map(&:to_i)
  end

  def cipher(key) # adding rotated array values to offset values
    @cipher_array = []
    x = -1
    4.times do
      x += 1
      @cipher_array << rotater(key)[x].flatten.join.to_i + time_used_for_offset[x]
    end
    return @cipher_array
  end
end
