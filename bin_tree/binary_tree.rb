require_relative '../queue'

class BinaryTreeNode
  attr_accessor :value, :left, :right, :parent, :next

  def initialize(val)
    @value = val
    @left, @right = nil, nil
    @parent = nil
    @next=nil
  end
end


class BinaryTree
  attr_accessor :root

  def initialize(v)
    @root = BinaryTreeNode.new(v)
    @root.parent = nil
  end

  def add_node(v)
    n = BinaryTreeNode.new(v)
    if @root.nil?
      @root = n 
    else
      parent = get_empty_children_node
      # puts "add node #{v}; parent= #{parent.value}"
      if parent.left
        parent.right = n
      else
        parent.left = n 
      end
      n.parent = parent
      # puts "parent.left = #{parent.left.value}" if parent.left
      # puts "parent.right = #{parent.right.value}" if parent.right
    end
  end


  def get_empty_children_node
    q = Queue.new
    q.push(@root)

    while (!q.isEmpty?)
      n = q.pop
      return n unless n.left && n.right 
      # t && t => t => does not return n
      # t && f => f => returns n
      # f && t => f => returns n
      # f && f => f => returns n

      q.push(n.left)
      q.push(n.right)
    end

  end

  def traverse
    q = Queue.new
    q.push(@root)

    while (!q.isEmpty?)
      n = q.pop
      puts "BT traverse: #{n.value}"
      q.push(n.left) if n.left
      q.push(n.right) if n.right
    end
  end

  def find_lca(node, n1, n2)
    return if node.nil?
    return node if n1 == node.value || n2 == node.value
    left_lca = find_lca(node.left, n1, n2)
    right_lca = find_lca(node.right, n1, n2)
    return node if !left_lca.nil? && !right_lca.nil?
    return left_lca if !left_lca.nil?
    return right_lca if !right_lca.nil?
  end

end

bt = BinaryTree.new(10)
bt.add_node(5)
bt.add_node(14)
bt.add_node(3)
bt.add_node(7)
bt.add_node(12)

bt.traverse
lca = bt.find_lca(bt.root,12,14)
puts lca.value