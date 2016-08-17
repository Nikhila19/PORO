# Codility Task description
# You are given N counters, initially set to 0, and you have two possible operations on them:

# increase(X) − counter X is increased by 1,
# max counter − all counters are set to the maximum value of any counter.
# A non-empty zero-indexed array A of M integers is given. This array represents consecutive operations:

# if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
# if A[K] = N + 1 then operation K is max counter.
# For example, given integer N = 5 and array A such that:

#     A[0] = 3
#     A[1] = 4
#     A[2] = 4
#     A[3] = 6
#     A[4] = 1
#     A[5] = 4
#     A[6] = 4
# the values of the counters after each consecutive operation will be:

#     (0, 0, 1, 0, 0)
#     (0, 0, 1, 1, 0)
#     (0, 0, 1, 2, 0)
#     (2, 2, 2, 2, 2)
#     (3, 2, 2, 2, 2)
#     (3, 2, 2, 3, 2)
#     (3, 2, 2, 4, 2)
# The goal is to calculate the value of every counter after all operations.

# Write a function:

# def solution(n, a)

# that, given an integer N and a non-empty zero-indexed array A consisting of M integers, returns a sequence of integers representing the values of the counters.

# The sequence should be returned as:

# a structure Results (in C), or
# a vector of integers (in C++), or
# a record Results (in Pascal), or
# an array of integers (in any other programming language).
# For example, given:

#     A[0] = 3
#     A[1] = 4
#     A[2] = 4
#     A[3] = 6
#     A[4] = 1
#     A[5] = 4
#     A[6] = 4
# the function should return [3, 2, 2, 4, 2], as explained above.

# Assume that:

# N and M are integers within the range [1..100,000];
# each element of array A is an integer within the range [1..N + 1].
# Complexity:

# expected worst-case time complexity is O(N+M);
# expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
# Elements of input arrays can be modified.

def solution(n, a)
  return [] if a.empty? || n < 1
  arr, len, max_ctr, max_changed = [], n, 0, false
  
  for i in 0..n-1 do arr << 0 end # this loops thru the whole array once
  a.each do |val|
    if val <= len
      arr[val -1] = arr[val -1] + 1 
      if arr[val -1] > max_ctr
        max_ctr = arr[val -1]
        max_changed = true      
      end
      #max_ctr = arr[val -1] > max_ctr ? arr[val -1] : max_ctr
    elsif val == n +1 
     # this loops thru the whole array once    
     if max_changed
      for i in 0..n-1 do 
        arr[i] = max_ctr  
      end
      max_changed = false
      end
    end
  end
  arr
end


# Missing integer
def solution(a)
  mode_arr = []
  #missing_min = a[0] + 1
  #large_val = 2147483648
  a.each do |aa|
    puts aa
    if aa > 0
    mode_arr[aa] = (mode_arr[aa] || 0 )+ 1 
    puts mode_arr[aa]
    end
  end
  puts "******"
  mode_arr.each { |aa| puts aa }
  puts "#######"
  puts "#######"
  mode_arr.each_with_index do |m, idx|
    puts "******"
    puts m
    puts idx
    puts "#######"
    return idx if idx != 0 && (m == 0 or m.nil?)
  end
      
end


def solution(a)
  missing_integer_arr = []
  
  a.each do |aa|
    if aa > 0
      missing_integer_arr[aa] = 0
    end
  end
  idx = 1
  while (idx < missing_integer_arr.length) do
    m = missing_integer_arr[i]
    return idx if idx > 0 && (m.nil? or m == 1)
  end
  if idx == missing_integer_arr.length
    return a.last + 1
  else
    return 1
  end

  # missing_integer_arr.each_with_index do |m, idx|
  #   puts "#{m}, #{idx}"
  #   return idx if idx > 0 && (m.nil? or m == 1)
  # end
  # return 0
end



