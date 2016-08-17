class MergeSort 
  def initialize(arr)
    mid = (arr.length/2).floor
    first_half, second_half = divideArray(arr)
    # first_half = mergeArrays(d1.first, d1.last)
    # d2 = divideArray(arr.slice(mid, arr.length))
    # second_half = mergeArrays(d2.first, d2.last)
    mergeArrays([first_half], [second_half])
  end

  def mergeArrays(arr1, arr2)
    puts("merging... #{arr1} and  #{arr2}")
    len1 = arr1.length
    len2 = arr2.length
    final_len = len1 + len2
    final_arr = []

    i, ptr1, ptr2 = 0, 0, 0
    
    while i < final_len
      if (ptr1 < len1 && ptr2 < len2) 
        if arr1[ptr1] < arr2[ptr2]
          min = arr1[ptr1]
          ptr1 = ptr1 + 1
        else
          min = arr2[ptr2]
          ptr2 = ptr2 + 1
        end
      else
        if (ptr1 > len1)
          min = arr2[ptr2] 
          ptr2 = ptr2 + 1
        else
          min = arr1[ptr1]
          ptr1 = ptr1 + 1
        end
      end
      final_arr[i] = min
      i = i +1
    end
    puts("... to #{final_arr}")
    return final_arr
  end

  def divideArray(arr)  
    current_arr = arr
    puts("dividing.. #{current_arr}")

    len = current_arr.length 
    return [current_arr.first, current_arr.last] if len == 2
    return current_arr if len < 2   
    q = (len/2).floor
    divideArray(current_arr.slice(0..q-1))
    divideArray(current_arr.slice(q..current_arr.length))
  end
end

c = MergeSort.new([2,3,9,5,4])
puts ("MergeSort... #{c}")



  