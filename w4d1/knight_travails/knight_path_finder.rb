require_relative "../skeleton/lib/00_tree_node.rb"
require "byebug"

class KnightPathFinder

    attr_reader :root_node, :considered_positions

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos) #@root_node.value = "a" => pos [0,0]
        @considered_positions = [@root_node.value]   #[[0, 0], [2, 1], [3, 3]]
        self.build_move_tree
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            node = queue.shift
            array = self.new_move_positions(node.value)
            array.each do |pos|
                node.add_child(PolyTreeNode.new(pos))
            end
            queue += node.children 
        end
    end

    def self.valid_moves(pos) #classKnight #initial [[0,0]] #val
        @legal_pos = (0...8).to_a.product((0...8).to_a)
         x,y = pos
         valid_pos = []
        if @legal_pos.include?(pos)
            @legal_pos.select do |possible_pos| 
                a,b = possible_pos
                if (a == x + 2 || a == x - 2) && (b == y + 1 || b == y - 1)
                    valid_pos << possible_pos
                elsif (a == x + 1 || a == x - 1) && (b == y + 2 || b == y - 2)
                    valid_pos << possible_pos
                end
            end
        end
        valid_pos
    end

    def new_move_positions(pos)
        arr = KnightPathFinder.valid_moves(pos)
        added_pos = []
        arr.each do |possible_pos|
            if !self.considered_positions.include?(possible_pos)
                @considered_positions << possible_pos
                added_pos << possible_pos
            end
        end
        added_pos
    end

    def trace_path_back(node)
        paths = [node.value]
        while !node.parent.nil?
            node = node.parent
            paths.unshift(node.value)
        end
        paths
    end

    def find_path(end_pos)
        end_node = @root_node.bfs(end_pos)
        res = self.trace_path_back(end_node)
    end

end

#load "knight_path_finder.rb"
#k = KnightPathFinder.new([0,0])