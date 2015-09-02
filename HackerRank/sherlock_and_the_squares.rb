def square_int?(x)
    Math.sqrt(x) % 1 == 0
end

def new_line(n)
    arr = n.chomp.split.map(&:to_i)
    a,b = arr[0],arr[1]
    count = Math.sqrt(b).floor - Math.sqrt(a - 1).floor
end

n = gets.to_i
n.times{p new_line(gets)}
