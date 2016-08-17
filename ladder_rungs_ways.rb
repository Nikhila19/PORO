$fib_memo = []
def ladder_rungs_ways(n, m)
  # to get the (num_ways % 2^m)
  # num_ways % 2^m = num_ways & ((1 << m) - 1)
  # ((1 << m) - 1) will make m LSB all 1s thereby creating a mask of m LSBs

 return 1 if n == 1
 return 2 if n == 2
 if $fib_memo[n]
   value = $fib_memo[n]
 else
   value = ladder_rungs_ways(n-1, m) + ladder_rungs_ways(n-2, m)
   puts "for n=#{n} fib_memo= #{value}"
   $fib_memo[n] = value
 end

 return value & ((1 << m) - 1)
end

# res = ladder_rungs_ways(4,3)
# puts "n=4; m=3; result=#{res}"

res = ladder_rungs_ways(5,4)
puts "n=5; m=3; result=#{res}"