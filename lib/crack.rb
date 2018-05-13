# require_relative 'encryptor.rb'
require 'date'

class Crack
  attr_reader     :encrypted_message,
                  :time

  def initialize(encrypted_message, time = nil)
    @encrypted_message = encrypted_message
    @time = time || Date.today
  end

end
