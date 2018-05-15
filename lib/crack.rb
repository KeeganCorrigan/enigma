require_relative 'encryptor.rb'
require_relative 'enigma.rb'
require 'Date'

class Crack
  attr_reader     :encrypted_message,
                  :date,
                  :char_map,
                  :template

  def initialize(encrypted_message, date = nil)
    @char_map = Encryptor.new.char_map
    @encrypted_message = encrypted_message
    @date = date || Date.today
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
end

# get encrypted_message.
# take last 7 of encrypted message.
# turn those into an array.
# break into array pairs every 4th letter.
# index positions: [0, 4], [1, 5], [2, 6]
# find first index positions of pairs in char_map, i.e [8, a] have index positions [34, 0]
# need to build template "..end.." with index positions for [0, 4], which are '.' and 'n', which have index positions [37, ]
#subtract

# def get_last_chars(encrypted_message)
#   encrypted_message.split(//).last(7)
# end
#
# def create_array_for_character_comparison_for_cracking(get_last_chars)
#   (get_last_chars[0] + get_last_chars[4]).split('')
# end
#
# def encrypted_char_index(char_pair)
#   char_pair.map do |char|
#     @char_map.index(char)
#   end
# end
#
# def rotate_until_decrypted(encrypted_message_pair_index, template_pair)
#   encrypted_message_pair_index = [34, 0]
#   actual_letters = ["8", "a"]
#   template_pair = [".", "n"]
#   # we want to reverse rotate encrypted_message_pair_index until BOTH options are at the same index value as "." and "n". We want to return the number of rotations that it took. This is a cipher key. This process is repeated 2 more times.
#   # multiples char map by three so we can count total number of reverse rotations if they exceed 39.
#   until encrypted_message_pair_index[0] == "." && encrypted_message_pair_index[1] == "n"
#     x = 0
#     encrypted_message_pair_index.map do |char|
#
#     #rotate in reverse through char map
#   char_map = @char_map * 3
#   char_map cipher[x]) % char_map.length]
#   end
#   return cipher_key
# end
