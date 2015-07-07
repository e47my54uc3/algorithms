def merge_sort(array)

  length = array.length

  return array if length < 2

  middle_index = length / 2


  left_sorted_array = merge_sort(array[0, middle_index])

  right_sorted_array = merge_sort(array[middle_index, length - middle_index])

  return merge(left_sorted_array, right_sorted_array)


end

def merge(array1, array2)

  returned_array = []


  while array1.length > 0 && array2.length > 0
    if array1[0] < array2[0]
      returned_array << array1.shift
    else
      returned_array << array2.shift
    end
  end
  returned_array += array1 + array2 #will clean up remainder elements

end

my_array = [5, 1, -1, 0, 8, 5]

p merge_sort(my_array) == [-1, 0, 1, 5, 5, 8]