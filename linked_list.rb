class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
    @next = nil
  end

end

class LinkedList
  attr_accessor :head

  def initialize
    @head = Node.new
  end

  def push(value)
    current = @head
    if @head.value.nil?
      @head.value = value
    else
      while current.next != nil
        current = current.next
      end
      current.next = Node.new(value)
    end
  end

  def pop(value)
    node = nil
    if @head.value == value
      node = @head
      @head = @head.next
      node.next = nil
      return node
    end
    current = @head
    while current.next != nil
      if current.next.value == value
        node = current.next
        current.next = current.next.next
        node.next = nil
        return node
      end
      current = current.next
    end
  end

  def display
    current = @head
    array = []
    if @head.next == nil
      array << @head.value
    else
      while current.next != nil
        array << current.value
        current = current.next
      end
      array << current.value
    end
    array
  end

  def fancy_display
    self.display.join(" -> ")
  end

end


class QueueLinkedList < LinkedList

  def pop
    node = @head
    @head = @head.next
    node.next = nil
    return node
  end

end

puts "LinkedList--------------------------------------------------------------"
list = LinkedList.new
list.push("Cari")
list.push("Raghu")
list.push("Darwin")
list.push("Jacob")
p list.display
puts
p list.pop("Cari")
puts
p list.fancy_display

puts

puts "QueueLinkedList---------------------------------------------------------"
queue = QueueLinkedList.new
queue.push("Cari")
queue.push("Raghu")
queue.push("Darwin")
queue.push("Jacob")
p queue.display
puts
p queue.pop
puts
p queue.fancy_display