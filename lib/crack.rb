require_relative 'encryptor.rb'
require_relative 'enigma.rb'
require 'Date'

class Crack
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
    cracked_cipher = []
    last_four_of_message.map.with_index do |letter, index|
      cracked_cipher << (@char_map.index(letter) - @char_map.index(cracking_template[index]))
    end
    return cracked_cipher
  end

  def brute_force(encrypted_message)
    key = "00000"
    crack = Enigma.new
    until crack.decrypt(encrypted_message, key).split(//).last(7).join == "..end.."
      key = (key.to_i + 1).to_s.rjust(5, "0")
    end
    @cracked_key = key
  end
end
