def cipher(s, n)
    ref = [*'a'..'z']
    capref = [*'A'..'Z']
    fref = ref + capref

    new = ref.rotate(n)
    newcap = capref.rotate(n)
    fnew = new + newcap

    s.chomp.tr(fref.join , fnew.join)

end

gets
s = gets.chomp
n = gets.to_i

puts cipher(s,n)

