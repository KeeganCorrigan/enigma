require './lib/enigma'

message = File.read(ARGV[0])

e = Enigma.new

File.write(ARGV[1], e.encrypt(message))

puts "Created 'encrypted.txt' with the key #{e.key} and date #{e.date}"
