#searching algorithms for array of names

def linear_search(arr, target)

  for i in 0...arr.length
    if (arr[i].first_name == target)
      return i
    end
  end

  return -1
end

#iterative version
def binary_search(arr, target)
  arr = arr.dup

  #sort objects by first name
  arr.sort!

  high = arr.length - 1
  low = 0

  while (high >= low)

    mid = (high + low) / 2
    if (arr[mid] == target)
      return "Found it in index #{mid}"
    elsif (arr[mid] < target)
      low = mid + 1
    else
      high = mid - 1
    end

  end #end while
  return "Didn't find it"
end

#big list of sorting algorithms in ruby!

# merge sort O(nlogn)
def mergeSort

end

# heap sort O(nlogn)
def heapSort

end

# quick sort O(n^2) average O(nlogn)
def quickSort

end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# insertion sort O(n^2)
def insertionSort(arr)
  arr = arr.dup

  for i in 0...arr.length
    val = arr[i]
    j = i - 1
    while j >= 0 && arr[j] > val
      arr[j+1] = arr[j]
      j -= 1
    end
    arr[j+1] = val
  end
  return arr

end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# selection sort O(n^2)
def selectionSort(arr)
  arr = arr.dup

  for i in 0...arr.length
    min = i
    for j in 0...arr.length
      if arr[j] > arr[min]
        arr[j], arr[min] = arr[min], arr[j]
      end
    end
  end
    return arr
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# bubble sort O(n^2)
def bubbleSort(arr)
  arr = arr.dup

  for i in 0...arr.length
    for j in 0...(arr.length - i - 1) #last element in correct place
      if (arr[j + 1] < arr[j])
        #swap index, ruby swap
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
      end
    end
  end
  return arr
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

names_array = ['bob', 'joe', 'anne', 'sue', 'james', 'jones', 'allie', 'hannah', 'mike', 'ethan']
p binary_search(names_array, 'joe')

unsorted_array = [5,8,12,34,2,1,5,7,8,9,3,6,1,8,10]
p "Bubble sort : #{bubbleSort(unsorted_array)}"
p "Insertion sort : #{insertionSort(unsorted_array)}"
p "Selection sort: #{selectionSort(unsorted_array)}"