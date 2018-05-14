require_relative 'encryptor.rb'

class OffSetCalculator
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

  def cipher_offset_time(time)
    if time.class == String
      time = time.to_i
    else time.class == Date
      time = time.strftime("%d%m%y").to_i
    end
    offset = (time ** 2).to_s.split(//).last(4).join
    offset.each_char.map(&:to_i)
  end

  def create_cipher(key, time)
    cipher_array = []
    x = -1
    4.times do
      x += 1
      cipher_array << rotater(key)[x].flatten.join.to_i + cipher_offset_time(time)[x]
    end
    return cipher_array
  end
end
