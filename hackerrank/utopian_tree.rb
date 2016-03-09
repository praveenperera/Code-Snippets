lis = []
t = gets.to_i

def even?(n)
    n.even?
end


def get_height(n)
    n = (0..n).to_a
    n.map!{|x| x + 1 }
    n = n.inject{|memo, n| even?(n) ? memo * 2 : memo +1}
    puts n
end

t.times do |i|
	lis << gets.to_i
end

lis.each do |i|
    get_height(i)
end
