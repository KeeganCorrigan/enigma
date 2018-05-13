require_relative 'encryptor.rb'
require 'Date'

class Crack
  attr_reader     :encrypted_message,
                  :time,
                  :char_map

  def initialize(encrypted_message, time = nil)
    @encrypted_message = encrypted_message
    @time = time || Date.today
    @char_map = (('a'..'z').to_a + ('0'..'9').to_a).push(' ', '.', ',')
  end

  def cracker(encrypted_message)
    template = ['n', 'd', '.', '.']
    last_four_of_message = encrypted_message.split(//).last(4)
    last_four_of_message.map.with_index do |letter, index|
      (@char_map.index(letter) - @char_map.index(template[index])).abs
    end
  end




end
