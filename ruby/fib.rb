 def infinite(n)
  (0..Float::INFINITY).
  lazy.
  with_object([0,1]).
  map { |x, last| last[1] = last[0] + (last[0] = last[1]) }.
  take(n).
  inject(:+)
end

 def finite(n)
  (0..n).
  lazy.
  with_object([0,1]).
  map { |x, last| last[1] = last[0] + (last[0] = last[1])}.
  select{|x| x.even?}.
  inject(:+)
end


@cache = {}; @cache[1] = 1; @cache[2] = 1
def memo_fib(n)
  @cache[n] ||= (memo_fib(n-1) + memo_fib(n-2))
end


p finite(888888)






