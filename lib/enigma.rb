class Enigma

  attr_reader :key,
              :message_to_encrypt,
              :rotated_array,
              :shifted_array
              :char_map

  def initialize(message_to_encrypt = "", key = generate_key)
    @key = nil
    @rotated_array = []
    @shifted_array = []
    @char_map = ('a'..'z').to_a + ('0'..'9').to_a
    @message_index = []
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
    @shifted_array = []
    x = -1
    4.times do
      x += 1
      @shifted_array << @rotated_array[x].flatten.join.to_i + time_used_for_offset[x]
    end
    return @shifted_array
  end

  def find_message_in_char_map(message, shifted_array)
    message_array = message.chars
    message_array.each do |letter|
      @message_index << @char_map.each_index.select do |index|
        @char_map[index] == letter
      end
    end
    return @message_index.flatten!
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
  

end
