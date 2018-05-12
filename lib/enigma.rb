require 'pry'

class Enigma

  attr_reader :key
              :message_to_encrypt

  def initialize(message_to_encrypt = "", key = generate_key)
    @key = nil
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
    rotated_array = []
    x = -1
    4.times do
      x += 1
      rotated_array << (key[0 + x] + key[1 + x]).split('').map do |number|
        number.to_i
      end
    end
    rotated_array
  end

  def time_used_for_offset
    time = Time.now.strftime("%m%d%y")
    offset = (time.to_i ** 2).to_s.split(//).last(4).join
    return offset.each_char.map(&:to_i)
  end
end
  # def rotate_b(key)
  #   (key[1] + key[2]).split('').map do |number|
  #     number.to_i
  #   end
  # end
  #
  # def rotate_c(key)
  #   (key[2] + key[3]).split('').map do |number|
  #     number.to_i
  #   end
  # end
  #
  # def rotate_d(key)
  #   (key[3] + key[4]).split('').map do |number|
  #     number.to_i
  #   end
  # end

  # def convert_rotate_key_to_integer_array


  # def generate_shift_amount_for_a_rotation_and_offset
  #   rotate_a(key) + time_used_for_offset
  # end
