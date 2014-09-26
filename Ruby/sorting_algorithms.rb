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


unsorted_array = [5,8,12,34,2,1,5,7,8,9,3,6,1,8,10]
p "Bubble sort : #{bubbleSort(unsorted_array)}"
p "Insertion sort : #{insertionSort(unsorted_array)}"