def cut_stick(n)
    arr = n
    smallest = arr.min
    new_arr = arr.map{|x| x - smallest}.reject{|x| x == 0}
    new_arr.to_a
end

n = gets.to_i
a = gets.chomp.split.lazy.map(&:to_i)
result = a.to_a
p n

while result.length > 1
    result = cut_stick(result)
    p result.length if result.length >= 1
end


