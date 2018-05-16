require './lib/enigma'

message = File.read(ARGV[0]).chomp

e = Enigma.new

File.write(ARGV[1], e.encrypt(message, ARGV[2], ARGV[3]))

puts "Created 'encrypted.txt' with the key #{e.key} and date #{e.date.strftime('%d%m%y')}"
