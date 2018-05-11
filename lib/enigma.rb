require 'pry'

class Enigma
  def initialize

  end

  def generate_key
    key = []
    5.times do
    key << rand(0..9).to_s
    end
    key
  end

  def rotate_a(key)
    key[0] + key[1]
  end

  def rotate_b(key)
    key[1] + key[2]
  end

  def rotate_c(key)
    key[2] + key[3]
  end

  def rotate_d(key)
    key[3] + key[4]
  end

  def time_used_for_offset
    time = Time.now.strftime("%m%d%y")
    offset = (time.to_i ** 2).to_s.split(//).last(4).join
    return offset.each_char.map(&:to_i)
  end

  def generate_shift_amount_for_a_rotation_and_offset(rotate_a), time_used_for_offset)

  end
end
