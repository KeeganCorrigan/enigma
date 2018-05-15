# frozen_string_literal: true

require_relative 'encryptor.rb'
require 'pry'

class CipherCalculator

  def key_rotater(key)
    rotated_array = [key[0..1], key[1..2], key[2..3], key[3..4]]
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
      cipher << key_rotater(key)[x].to_i + offset_date_for_cipher(date)[x]
    end
    cipher
  end
end
