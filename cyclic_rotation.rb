# Given an array and a number n, shift left the array n number of times
def solution(a=[], k)
  # write your code in Ruby 2.2
  return a if a.empty?
  len = a.length
  k = k % len if k > len
  slc = []

  if k >= 0
    first = (0..len-k-1)
    k.step(1, -1) do |i| 
      puts i
      idx = len -i
      slc << a[idx]
    end
    first.each do |i|
      slc << a[i]
    end
  else
    k = -(k)
    (k..len-1).each do |i| 
      slc << a[i]
    end
    
    k.times do |i|
      slc << a[i]
    end
  end
  
  return slc
end