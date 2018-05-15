# frozen_string_literal: true

require_relative 'encryptor.rb'

class CipherCalculator
  def key_rotater(key)
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

  def offset_date_for_cipher(date)
    if date.class == String
      date = date.to_i
    else
      date = date.strftime('%d%m%y').to_i
    end
    offset = (date**2).to_s.split(//).last(4).join
    offset.each_char.map(&:to_i)
  end

  def create_cipher(key, date)
    cipher = []
    x = -1
    4.times do
      x += 1
      cipher << key_rotater(key)[x].flatten.join.to_i + offset_date_for_cipher(date)[x]
    end
    cipher
  end
end
