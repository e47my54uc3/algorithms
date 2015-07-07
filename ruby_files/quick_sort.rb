
def quicksort(array)

  if array.length <= 1
    return array
  else
    pivot = array.sample
    array.delete_at(array.index(pivot))
    less = []
    greater = []

    array.each do |x|
      if x <= pivot
        less << x
      else
        greater << x
      end
    end
  end

    sorted_array = []
    sorted_array << quicksort(less)
    sorted_array << pivot
    sorted_array << quicksort(greater)

    sorted_array.flatten

 
end

p quicksort([2,-4,5,4])