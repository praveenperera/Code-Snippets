def calculate_choc(n,c,m)
    initial = n/c
    newc = (initial.to_f/m.to_f).floor
    final = initial + newc

    leftover = initial%m
    new_initial = leftover + newc

    while (new_initial >= m)
        newc = (leftover + newc)/m
        final = final + newc

        leftover = new_initial%newc
        new_initial = leftover + newc
    end

    final


end

t = gets.to_i
t.times{
    (n, c, m) = gets.split.map(&:to_i)
    puts calculate_choc(n,c,m)
}
