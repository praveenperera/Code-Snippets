n = gets.to_i

def prof(a,b)
    k = a[1]
    students_on_time = b.reject{|x| x > 0}.length
    puts students_on_time < k ? "YES" : "NO"
end

n.times do
   a = gets.split(" ").map(&:to_i)
   b = gets.split(" ").map(&:to_i)
   prof(a,b)
end


