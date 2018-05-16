require './lib/encryptor.rb'
require './lib/enigma.rb'
require 'date'

class Crack
  attr_reader     :encrypted_message,
                  :date,
                  :char_map

  def initialize(encrypted_message, date = nil)
    @char_map = Encryptor.new.char_map
    @encrypted_message = encrypted_message
    @date = date || Date.today
  end

  def cracker(encrypted_message)
    cracking_template = ['n', 'd', '.', '.']
    last_four_of_message = encrypted_message.split(//).last(4)
    cracked_cipher = []
    last_four_of_message.each_with_index do |letter, index|
      cracked_cipher << (
        @char_map.index(letter) - @char_map.index(cracking_template[index])
      )
    end
    cracked_cipher
  end

  def brute_force(encrypted_message)
    key = '00000'
    crack = Enigma.new
    until crack.decrypt(encrypted_message, key).split(//).last(7).join == '..end..'
      key = (key.to_i + 1).to_s.rjust(5, '0')
    end
    key
  end
end
