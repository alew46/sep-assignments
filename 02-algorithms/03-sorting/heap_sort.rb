def heap_sort(array)
  n = array.length - 1 #array length
  a = array #shorthand for array

  (n / 2).downto(0) do |i|      #for half the length of the array, call heapify
    create_max_heap(a, i, n)    #a is the array, i is the current index as parent, length of the array is the limit
  end

  while n > 0 #while array is not empty
    a[0], a[n] = a[n], a[0] #swap values at the first and last positions of the array
    n -= 1 #decrement length of array by 1 to account for 1 sorted item
    create_max_heap(a, 0, n) #re-heapify so that largest element is at root node position
  end

  a #return sorted array
end

def create_max_heap(array, parent, limit)
  root = array[parent]
  while (child = 2 * parent) <= limit do
    child += 1 if child < limit && array[child] < array[child + 1]
    break if root >= array[child]
    array[parent], parent = array[child], child
  end
  array[parent] = root
end

test_array_1 = [12, 0, -9, 567, 201, 46, 99, 11]
puts heap_sort(test_array_1)
