require_relative 'encryptor.rb'
require_relative 'enigma.rb'
require 'Date'

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
    last_four_of_message.map.with_index do |letter, index|
      (@char_map.index(letter) - @char_map.index(cracking_template[index])).abs
    end
  end
end
