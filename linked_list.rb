class Node

    attr_accessor :value, :next_node

    def initialize val, next_in_line
        @value = val
        @next_node = next_in_line
        puts "Initialized a Node with value:  " + value.to_s 
    end
end

class LinkedList

    def initialize val
        # Initialize a new node at the head
        @head = Node.new(val,nil)
    end
    
    def add(value)
        # Traverse to the end of the list
        # And insert a new node over there with the specified value
        current = @head
        while current.next_node != nil
            current = current.next_node
        end 
        current.next_node = Node.new(value,nil)
        self    
    end

    def delete(val)
        current = @head
        if current.value == val
            # If the head is the element to be delete, the head needs to be updated
            @head = @head.next_node
        else
            # ... x -> y -> z
            # Suppose y is the value to be deleted, you need to reshape the above list to :
            #   ... x->z
            # ( and z is basically y.next_node )
            current = @head
            while (current != nil) && (current.next_node != nil) && ((current.next_node).value != val)
                current = current.next_node
            end 

            if (current != nil) && (current.next_node != nil)
                current.next_node = (current.next_node).next_node
            end
        end
    end
    
    def display
        # Traverse through the list till you hit the "nil" at the end
        current = @head
        full_list = [] 
        while current.next_node != nil 
            full_list += [current.value.to_s]
            current = current.next_node
        end
        full_list += [current.value.to_s]
        puts full_list.join("->")
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