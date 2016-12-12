# return all the subsets of a given set
class PowerSet
  def subset(arr, start, stop)
    return [[]] if stop-start < 0

    prev_result = subset(arr, start, stop-1)
    curr_result = prev_result.map { |ele| ele + [arr[stop]] }
    return prev_result + curr_result
  end
end

ps = PowerSet.new
puts ps.subset([1,2,3,4], 0, 3).inspect