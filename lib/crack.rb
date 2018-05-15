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

  # get encrypted_message.
  # take last 7 of encrypted message.
  # turn those into an array.
  # break into array pairs every 4th letter.
    # index positions: [0, 4], [1, 5], [2, 6]
  # find first index positions of pairs in char_map, i.e [8, a] have index positions []
  # need to build template "..end.." with index positions for [0, 4], which are '.' and 'n'
  #subtract

  def get_last_chars(encrypted_message)
    encrypted_message.split(//).last(7)
  end

  def create_array_for_character_comparison_for_cracking(get_last_chars)
    (get_last_chars[0] + get_last_chars[4]).split('')
  end

  # def rotate_until_decrypted(encrypted_message_array)
  #   decrypted_letters = []
  #   encrypted_message_array.
  # end
end


  # def cracker(encrypted_message)
  #   cracking_template = ['n', 'd', '.', '.']
  #   last_four_of_message = encrypted_message.split(//).last(4)
  #   cracked_cipher =
  #   last_four_of_message.map.with_index do |letter, index|
  #     (@char_map.index(letter) - @char_map.index(cracking_template[index])).abs
  #   end
  #   return cracked_cipher
  # end
