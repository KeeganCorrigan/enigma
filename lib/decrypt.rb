require './lib/enigma'

encrypted = File.read(ARGV[0])

e = Enigma.new

File.write(ARGV[1], e.decrypt(encrypted, ARGV[2], ARGV[3]))

puts "Created 'decrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"
