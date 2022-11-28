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

end