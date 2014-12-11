def binarySearch(target, arr)

  arr.sort!
  low = 0
  high = arr.length-1

  while high >= low

    mid = (high+low)/2
    if arr[mid] == target
      return "Hey we found it at the sorted index #{mid}"
    elsif arr[mid] > target
      high = mid-1
    else
      low = mid+1
    end

  end
  return "We didnt find it"
end

arr_test=[11,3,15,6,8,9]
p binarySearch(8,arr_test)
p binarySearch(9,arr_test)
p binarySearch(18,arr_test)


