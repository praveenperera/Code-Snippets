def find_solution(n)
    value = 0
    array = (0..n).to_a.reverse!

    array.each_with_index do |v,i|
        if v % 3 == 0 && i == 0
            value = "5" * n
        elsif v % 3 == 0 && ((n-v) % 5 == 0)
            value = "5" * v + "3" * i
        elsif i == n && i % 5 == 0
            value = "3" * n
        end
        break if value
    end

    if value.nil?
        puts -1
    else
        puts value.to_i
    end
end

cases = gets.to_i
cases.times do
    n = gets.to_i
    find_solution(n)
end
