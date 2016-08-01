def make_change(amt, coins, index, memo)

  if memo[amt][index] > 0
    puts "************* I already know that memo[#{amt}][#{index}] = #{memo[amt][index]}"
    return memo[amt][index] 
  end

  # doing this just to print the value for even the last index
  if index <= coins.length-1
    value = coins[index] 
    puts "amount = #{amt}; value = #{value}"
  end

  # base case
  return 1 if index >= coins.length-1

  value = coins[index]
  num_ways = 0
  i = 0
  while (i * value <= amt) do
    amt_remaining = amt - i*value
    num_ways = num_ways + make_change(amt_remaining, coins, index+1, memo)
    i = i+1
  end

  memo[amt][index] = num_ways
  puts " ====> memo[#{amt}][#{index}] = #{num_ways}" 
  num_ways
end

def compute_change(n, coins)
  memo = []
  for i in 0..n do 
    memo[i] = []
    for j in 0..coins.length-1
      memo[i][j] = 0
    end 
  end
  make_change(n,coins, 0, memo)
end

puts compute_change(100, [25,10,5,1])
puts "*" * 30
puts compute_change(100, [25,10,5,1])