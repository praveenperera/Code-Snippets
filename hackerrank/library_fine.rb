actual = gets.to_s.split(" ").map(&:to_i)
expected = gets.to_s.split(" ").map(&:to_i)

fine = 0

if actual[2] < expected[2]
    0
elsif actual[2] == expected[2]

    if actual[1] < expected[1]
        0
    elsif actual[1] > expected[1]
        fine = (actual[1] - expected[1]) * 500
    else
        if actual[0] < expected[0]
            0
        elsif  actual[0] > expected[0]
             fine = (actual[0] - expected[0]) * 15
        else
            0
        end
    end
else
    fine = 10000
end

puts fine
