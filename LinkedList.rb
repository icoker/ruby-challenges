class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

class Stack
  attr_reader :data

  def initialize
      @data = nil
  end

  # Push a value onto the stack
  def push(value)
      @data = LinkedListNode.new(value, @data)
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
      # I RETURN A VALUE
      if @data == nil 
        return print "nil" 
      else 
        print "#{@data.value}" 
      end
      @data = @data.next_node
  end

end

## Reverse linked list using stack
# def reverse_list(list)
#   # ADD CODE HERE
#   stack = Stack.new

#   while list
#       # ADD CODE HERE
#       stack.push(list.value)
#       list = list.next_node
#   end

#   # ADD CODE HERE
#   return stack.data
# end

# Recursive mutation reversal
def reverse_list(list, previous=nil)
  # do stuff
  if list
    next_node = list.next_node
    list.next_node = previous
    if next_node
      reverse_list(next_node, list)
    else
      return list
    end
  end
end

#Test for inifinite linked list
def detect_cycle(list)
  tortoise = list.next_node
  hare = list.next_node

  while hare
    return "No Loop Found" if hare.next_node == nil

    hare = hare.next_node
    return "No Loop Found" if hare.next_node == nil

    hare = hare.next_node
    tortoise = tortoise.next_node
    return "Loop Found" if hare == tortoise
  end

  return "No Loop Found"
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
print_values(node3)
puts "---------"
# revlist = 
print_values(reverse_list(node3))
puts detect_cycle(node3)



node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3
puts detect_cycle(node3)