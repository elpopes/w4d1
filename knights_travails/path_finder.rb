require_relative "00_tree_node.rb"

class KnightPathFinder
        def initialize(starting_pos)
                @starting_pos = starting_pos
                @root_node = PolyTreeNode.new(starting_pos)
                @considered_pos = []
        end

        def build_move_tree

        end

        def self.valid_moves(pos)
                h = pos[0]
                v = pos[1]
                
                try_moves = [
                        [h + 2, v + 1],
                        [h + 2, v - 1],
                        [h + 1, v + 2],
                        [h + 1, v - 2],
                        [h - 2, v + 1],
                        [h - 2, v - 1],
                        [h - 1, v + 2],
                        [h - 1, v - 2]
                ]

                possible_moves = []

                try_moves.each do |move|
                        possible_moves << move if move.all?{|val| val >= 0 && val < 8}
                end
                
                return possible_moves
        end

        def new_move_pos(pos)
                #calls valid move and filters out already considered positions

        end



        # def find_path(end_pos)
        
        # end
end

kpf = KnightPathFinder.new([0,0])
p KnightPathFinder.valid_moves([0,0])