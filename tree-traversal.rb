class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

    def dfs(search_value)
        return self if payload == search_value
        @children.each do |child|
            node = child.dfs(search_value)
            return node unless node.nil?
        end
        nil
    end

    def bfs(search_value)
        current_node = self
        queue = MyQueue.new 

        while !current_node.nil?
            if current_node.payload == search_value
                return current_node
            end

            current_node.children.each do |child|
                queue.enqueue(child)
            end

            current_node = queue.dequeue
        end
    end
end

class MyQueue
    def initialize
        @queue = []
    end

    def enqueue(item)
        @queue.push(item)
    end

    def dequeue
        @queue.shift
    end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

puts trunk.dfs(11).payload
puts trunk.bfs(11).payload