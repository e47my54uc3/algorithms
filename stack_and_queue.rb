class Queue
  attr_accessor :store
  def initialize
    @store = []
  end

  def enqueue(element)
    @store << element
  end

  
  def dequeue
    raise "Queue Underflow - The queue is empty" if self.is_empty?
    @store.shift
  end

 
  def peek
    @store.first
  end

  def size
    @store.length
  end

  def is_empty?
    self.size == 0
  end

end


class Stack
  attr_accessor :store, :top
  def initialize
    @store = []
    @top = -1
  end

  def push(element)
    @store.push(element)
    @top += 1
  end

  def peek
    raise "The stack is empty" if self.is_empty?
    @store[top]
  end

  def pop
    raise "The stack is empty" if self.is_empty?
    top_element = @store.pop
    @top -= 1
    top_element
  end

  def size
    @store.length
  end

  def is_empty?
    self.size == 0
  end

end