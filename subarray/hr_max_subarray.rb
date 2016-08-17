# https://www.hackerrank.com/challenges/maxsubarray
def contig(arr)
  len = arr.length
  max_current, max_global = [], []
  max_current[0], max_global[0] = arr[0].to_i, arr[0].to_i
  current_start_index, start_index, stop_index = 0, 0, 0

  for i in 1..(len-1)
    ele = arr[i].to_i
    m = max_current[i-1] + ele
    if m > ele
      max_current[i] = m
    else 
      max_current[i] = ele 
      current_start_index = i
    end
    if max_current[i] > max_global[i-1]
      max_global[i] = max_current[i]
      stop_index = i
      start_index = current_start_index
    else
      max_global[i] = max_global[i-1]
    end
  end
  max_global.last 
end

def non_contig(arr)
  max_current, max_global = [],[]
  max_current[0], max_global[0] = arr[0].to_i, arr[0].to_i
  for i in 1..arr.length-1
    ele = arr[i].to_i
    m = max_current[i-1] + ele

    if m > max_current[i-1]
      max_current[i] = m
    else
      max_current[i] = max_current[i-1]
    end

    if max_current[i] > max_global[i-1]
      max_global[i] = max_current[i]
    else
      max_global[i] = max_global[i-1]
    end
  end
  max_global.last
end

num_test_cases = 0
result = []

ARGF.each_line do |line|
  if ARGF.lineno == 1
      num_test_cases = line.chomp.to_i
  else
   if ARGF.lineno.even?
      num_elems = line.chomp.to_i
    else
      arr = line.chomp.split(" ")
      # cont = contig(arr, num_elems)
      # non_cont = non_contig(arr, num_elems)
      result << "#{contig(arr)}" + " " +  "#{non_contig(arr)}"
    end
  end
end
puts result


