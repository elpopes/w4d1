class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = Array.new
    end

    attr_reader :parent, :children, :value

    def parent=(node)
        if @parent != nil
            self.parent.children.delete(self)   
        end      
        @parent = node 
        unless @parent == nil || node.children.include?(self)
            node.children << self
        end
        # p @children
    end

    def inspect
        "#<Node:#{self.object_id} parent:#{self.parent} children:#{self.children}"
    end

    def add_child(node)
        @children << node unless @children.include?(node)
        node.parent = self
    end

    def remove_child(node)

        raise StandardError.new "Node is not a child" unless node.parent.children.include?(node)
        node.parent = nil
        
    end

    def dfs(target_value)
        return self if self.value == target_value
        @children.each do |child|
            result = child.dfs(target_value)
            return result unless result == nil
        end
        return nil

    end

    def bfs(target_value)
        arr = [self]
        while arr.length > 0
            current_node = arr.shift
            return current_node if current_node.value == target_value
            arr += current_node.children
        end
        return nil
    end

end

