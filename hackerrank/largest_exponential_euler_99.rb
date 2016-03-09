t = gets.to_i
arr = (0...t).to_a.lazy.map{|x| gets.chomp.split.map(&:to_i)}.map{|k,v| [v*Math.log(k)]+[k,v]}.sort{|x,y| x <=> y }
n = gets.to_i
puts arr[n-1].drop(1).join(" ")
