class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent) #node1 = new_parent #node2.parent = node1
        return @parent = nil if new_parent.nil?
        
        if @parent.is_a?(PolyTreeNode)
            prev_parent = @parent
            prev_parent.children.delete(self)
        end
        @parent = new_parent #node2.parent = node1
        if  !new_parent.children.include?(self)
            new_parent.children << self #node1.children << node2
        end
    end

    def add_child(new_child)
        new_child.parent = self
    end

    def remove_child(new_child) 
        raise "Node is not a child" if !self.children.include?(new_child)
        new_child.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            return result if !result.nil?
        end
        nil
    end
  
    def bfs(target)
        queue = [self]
        # debugger
        until queue.empty?
            node = queue.shift
            if node.value == target
                return node
            else
                node.children.each { |child| queue << child }
                # queue << node.children []
            end
        end
        nil
        
    end


end
