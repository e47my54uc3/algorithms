require_relative './stack_and_queue'

class Node
  attr_accessor :value, :left_child, :right_child
  def initialize(value = nil, left_child=nil, right_child=nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end
end

#      1
#    /    \
#   2      3
#  / \    / \
# 4   5  6   7


class Binary_Tree
  attr_accessor :root
  def initialize(root = nil)
    @root = Node.new(root)
  end


  # I - DEPTH FIRST SEARCH (DFS): preorder, inorder, and postorder

  # 1) preorder traversal: each node is processed before (pre) either of its sub-trees: 1 2 4 5 3 6 7

  def preorder(node)
    return if !node
    print node.value, " "
    preorder(node.left_child)
    preorder(node.right_child)
  end

  # 2) inorder traversal: traverse left child, visit the node, then traverse the right child: 4 2 5 1 6 3 7

  def inorder(node)
    return if !node
    inorder(node.left_child)
    print node.value, " "
    inorder(node.right_child)
  end

  # 3) postorder traversal :traverse left child, visit right child, then visit node. 4 5 2 6 7 3 1

  def postorder(node)
    return if !node
    postorder(node.left_child)
    postorder(node.right_child)
    print node.value, " "
  end


  def level_order(node)
    return if !node
    queue = Queue.new
    queue.enqueue(node)

    while !queue.is_empty?
      visited_node = queue.dequeue
      print visited_node.value, " "

      queue.enqueue(visited_node.left_child) if visited_node.left_child
      queue.enqueue(visited_node.right_child) if visited_node.right_child
    end
  end

end

# TEST DRIVE
binary_tree = Binary_Tree.new()
root = Node.new(1)
a = Node.new(2)
b = Node.new(3)
d = Node.new(4)
e = Node.new(5)
f = Node.new(6)
g = Node.new(7)

binary_tree.root = root

binary_tree.root.left_child = a
binary_tree.root.right_child = b

a.left_child = d
a.right_child = e

b.left_child = f
b.right_child = g

# print "Results after running Preorder on the binary tree: "
# binary_tree.preorder(root)

print "\n\nResults after running level order on the binary tree: "
binary_tree.level_order(root)
puts




