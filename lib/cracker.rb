require './lib/encryptor.rb'
require './lib/enigma.rb'
require 'date'

class Cracker
  attr_reader     :encrypted_message,
                  :date,
                  :char_map,
                  :template,
                  :key,
                  :cracked_key

  def initialize(encrypted_message, date = nil)
    @char_map = Encryptor.new.char_map
    @encrypted_message = encrypted_message
    @date = date || Date.today
    @cracked_key = nil
  end

  def cracker(encrypted_message)
    cracking_template = ['n', 'd', '.', '.']
    last_four_of_message = encrypted_message.split(//).last(4)
    cipher = last_four_of_message.map.with_index do |letter, index|
      (@char_map.index(letter) - @char_map.index(cracking_template[index]))
    end
    cipher
  end

  def brute_force_encryption_key(encrypted_message)
    key = '00000'
    crack = Enigma.new
    until crack.decrypt(encrypted_message, key)[-7..-1] == '..end..'
      key = (key.to_i + 1).to_s.rjust(5, '0')
    end
    @cracked_key = key
  end
end
