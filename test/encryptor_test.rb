gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require './lib/encryptor.rb'

class EncryptorTest < Minitest::Test
  def test_it_exists
    e = Encryptor.new('hello', '12345', Date.new(2018, 5, 12))
    assert_instance_of(Encryptor, e)
  end

  def test_encryptor_accepts_input_key
    e = Encryptor.new('hello', '12345', Date.new(2018, 5, 12))
    assert_equal 5, e.key.length
    assert_equal String, e.key.class
    assert_equal '12345', e.key
  end

  def test_encryptor_accepts_message
    e = Encryptor.new('hello', '12345', Date.new(2018, 5, 12))
    assert_equal 'hello', e.message
  end

  def test_encryptor_creates_key_if_none_enetered
    e = Encryptor.new('hello')
    assert_equal 5, e.key.length
    assert_equal String, e.key.class
  end

  def test_encryptor_creates_date_if_none_entered
    e = Encryptor.new('hello', '12345')
    assert_equal Date.today, e.date
  end

  def test_date_can_be_entered_as_a_string
    e = Encryptor.new('hello', '12345', '2018-05-13')
    assert_equal '2018-05-13', e.date
  end

  def test_char_map
    e = Encryptor.new('theend', '12345', Date.new(2018, 5, 12))
    assert_equal false, e.char_map.include?('!')
    assert_equal true, e.char_map.include?('8')
    assert_equal false, e.char_map.include?('arp')
    assert_equal 39, e.char_map.length
  end

  def test_encryptor_generates_key_if_no_user_input
    e = Encryptor.new('theend', '12345', Date.new(2018, 5, 12))
    assert_equal 5, e.key.length
    assert_equal String, e.key.class
  end

  def test_find_message_index_in_char_map
    e = Encryptor.new('abcdef')
    assert_equal [0, 1, 2, 3, 4, 5], e.find_message_index_in_char_map(e.message)
  end

  def test_message_index_is_correct
    e = Encryptor.new('hello', '12345', Date.new(2018, 5, 12))
    assert_equal [7, 4, 11, 11, 14], e.find_message_index_in_char_map(e.message)
  end

  def test_rotate_text_to_encrypt_and_decrypt
    e = Encryptor.new('hello', '12345', Date.new(2018, 5, 12))
    message_index = [7, 4, 11, 11, 14]
    cipher = [20, 26, 36, 49]
    operator = :+
    assert_equal '14iv8', e.rotate_text_to_encrypt_and_decrypt(message_index, cipher, operator)
  end

  def test_reverse_rotation_for_decrypt
    e = Encryptor.new('14iv8', '12345', Date.new(2018, 5, 12))
    message_index = [27, 30, 8, 21, 34]
    cipher = [20, 26, 36, 49]
    operator = :-
    assert_equal 'hello', e.rotate_text_to_encrypt_and_decrypt(message_index, cipher, operator)
  end

  def test_it_encrypts
    e = Encryptor.new('hello', '12345', Date.new(2018, 5, 12))
    cipher_text = e.encrypt
    assert_equal '14iv8', cipher_text
  end

  def test_it_decrypts
    e = Encryptor.new('14iv8', '12345', Date.new(2018, 5, 12))
    plain_text = e.decrypt
    assert_equal 'hello', plain_text
  end
end
