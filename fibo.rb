
$fibo_mem = []


# returns the nth fibonacci element
def fibo(n)
  return 1 if n > 0 && n <= 2
  return 0 if n < 0
  return $fibo_mem[n] if $fibo_mem[n]

  print "#{n}; "

  sum = fibo(n-1) + fibo(n-2)
  $fibo_mem[n] = sum
  return sum
end

for j in 1..10
  i = 11-j
puts "#{i}th element is  #{fibo(i)}"
end