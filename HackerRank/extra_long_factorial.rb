n = gets.to_i
index_array = (1..n-1).to_a
result = index_array.inject(n){|memo, n| memo * n}

puts result
