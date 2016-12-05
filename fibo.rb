
$fibo_mem = []


# # returns the nth fibonacci element
# def fibo(n)
#   return 1 if n > 0 && n <= 2
#   return 0 if n < 0
#   return $fibo_mem[n] if $fibo_mem[n]

#   print "#{n}; "

#   sum = fibo(n-1) + fibo(n-2)
#   $fibo_mem[n] = sum
#   return sum
# end

# for j in 1..10
#   i = 11-j
# puts "#{i}th element is  #{fibo(i)}"
# end

def fibo_recursive(n)
  if n == 0 || n==1
    puts "fibonacci of #{n} : #{n}"
    return n 
  end
  if n == 2
    puts "fibonacci of #{n} : #{1}"
    return 1 
  end
  if $fibo_mem[n]
    puts "fibonacci of #{n} : #{$fibo_mem[n]}"
    return $fibo_mem[n] 
  end

  sum = fibo_recursive(n-1) + fibo_recursive(n-2)
  puts "fibonacci of #{n} : #{sum}"

  $fibo_mem[n] = sum
  return sum
end
fibo_recursive(10)
