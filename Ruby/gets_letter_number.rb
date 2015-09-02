#!/usr/bin/env ruby
a = ('a'..'z').to_a
find = Hash[a.map.with_index(1).to_a]

puts "Enter the Letter: "
letter = gets.to_s.chomp.downcase

puts "Your letter (#{letter}) is letter number #{find[letter]} in the alphabet"
