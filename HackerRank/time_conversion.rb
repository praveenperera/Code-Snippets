n = gets.to_s
n = n.strip

indicator = n[(n.length-2)..-1]

n = n[0..-3]
n = n.split(":")
n[0] = n[0].to_i + 12 if indicator.upcase == "PM" && n[0].to_i != 12
n[0] = "00" if indicator.upcase == "AM" && n[0].to_i == 12

puts n.join(":")
