require_relative 'enigma.rb'

class OffSetCalculator
  def rotater(key) #produces a rotated array based on the key inputs
    binding.pry
    x = -1
    4.times do
      x += 1
      @rotated_array << (key[0 + x] + key[1 + x]).split('').map do |number|
        number.to_i
      end
    end
    return @rotated_array
  end

  def time_used_for_offset # the offset used to add to rotated array
    time = Time.now.strftime("%m%d%y")
    offset = (time.to_i ** 2).to_s.split(//).last(4).join
    return offset.each_char.map(&:to_i)
  end

  def generate_shift_array # adding rotated array values to offset values
    @shifted_array = []
    x = -1
    4.times do
      x += 1
      @shifted_array << @rotated_array[x].flatten.join.to_i + time_used_for_offset[x]
    end
    return @shifted_array
  end
end
