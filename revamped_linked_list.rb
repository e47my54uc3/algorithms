class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class List
  attr_accessor :head
  def initialize(head)
    @head = head
  end

  def each
    current = @head
    while current
      yield current
      current = current.next_node
    end
  end

  def find(value)
    self.each {|node| return node if node.value == value}
  end

  def find_all(value)
    nodes = []
    self.each { |node| nodes << node if node.value == value}
    nodes
  end

  def push(value)
    last.next_node = Node.new(value, nil)
  end

  def unshift(value)
    @head = Node.new(value, @head)
  end

  def last
    self.each {|node| return node if node.next_node == nil}
  end

  def length
    count = 0
    node = @head
    while node
      count += 1
      node = node.next_node
    end
    count
  end

  def remove_linked_list_duplicates(head)
    current_node = head
    previous_node = head
    number_of_repeats = Hash.new(0)
    while current_node != nil
      if number_of_repeats[current_node.value] > 0
        previous_node.next_node = current_node.next_node
      else
        number_of_repeats[current_node.value] += 1
        previous_node = current_node
      end
      current_node = current_node.next_node
    end
    head
  end

  def delete_from_middle(node)
    return false if node == nil || node.next_node == nil

    node.value = node.next_node.value
    node.next_node = node.next_node.next_node
    true
  end
end


# e = Node.new(5, nil)
# d = Node.new(4, e)
# c = Node.new(3, d)
# b = Node.new(3, c)
# a = Node.new(1, b)

# list = List.new(a)

# list.each { |node| print node.value, " "}


# puts "\nThe first node with value 3 is:"
# p list.find(3)

# puts "\nThe nodes whose value is 3 are: "
# p list.find_all(3)

# puts "\nAdding a node with value 6 to the end of the linked list:"
# list.push(6)
# print "The values of the list are now: "
# list.each {|node| print node.value, " "}

# puts "\nThe last node is:"
# p list.last

# puts "\nAdding a node of value 0 at the beginning of the linked list:"
# list.unshift(0)
# print "The values of the list are now: "
# list.each {|node| print node.value, " "}

# puts "\n\nThe length of the linked list currently is #{list.length}"
# last_node_list = List.new(list.last)
# p last_node_list.length
# p List.new(nil).length

# e = Node.new(1, nil)
# d = Node.new(4, e)
# c = Node.new(3, d)
# b = Node.new(3, c)
# a = Node.new(1, b)

# list = List.new(a)

# print "Initially, the values of the list are: "
# list.each {|node| print node.value, " "}
# puts

# p list.remove_linked_list_duplicates(a)

# print "\nAfter removing the duplicates, the values of the list are: "
# list.each {|node| print node.value, " "}
# puts

e = Node.new(1, nil)
d = Node.new(4, e)
c = Node.new(3, d)
b = Node.new(3, c)
a = Node.new(1, b)

list = List.new(a)

print "Initially, the values of the list are: "
list.each {|node| print node.value, " "}
puts

p list.delete_from_middle(d)

print "\nAfter removing the duplicates, the values of the list are: "
list.each {|node| print node.value, " "}
puts

