require './lib/enigma'

encrypted = File.read(ARGV[0])

e = Enigma.new

File.write(ARGV[1], e.crack(encrypted, ARGV[2]))

puts "Created 'cracked.txt' with the key #{e.key} and the date #{ARGV[2]}"