require './lib/enigma'

encrypted = File.read(ARGV[0]).chomp

e = Enigma.new

File.write(ARGV[1], e.crack(encrypted, ARGV[2]))

puts "Created 'cracked.txt' with the cracked key #{e.cracked_key} and the date #{ARGV[2]}"
