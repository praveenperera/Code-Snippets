def gets_divisble_count(n)
    arr = n.to_s.chars.lazy.map(&:to_i).reject{|x| x == 0}.select{|x| n % x == 0}.to_a.length
end

n = gets.to_i
n.times{p gets_divisble_count(gets.to_i)}

