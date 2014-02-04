module Chess
  class Slider < Piece
    CARDINAL = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    DIAGONAL = [[1, 1], [-1, 1], [-1, -1], [1, -1]]

    def valid_moves
      p "in valid_moves"
      row, col = @square
      [].tap do |all_valids|
        @move_directions.each do |dir_row, dir_col|
          next_move = [row + dir_row, col + dir_col]
          until !move_valid?(next_move)
            all_valids << next_move
            break if !@board[next_move].nil?
            next_move = [next_move[0] + dir_row, next_move[1] + dir_col]
          end
        end
      end
    end
  end

  class Queen < Slider
    def initialize(color, square, board)
      super(color, square, board)
      @move_directions =  CARDINAL + DIAGONAL
    end

    def to_s
      @color == "white" ? "\u2655".encode("UTF-8") : "\u265B".encode("UTF-8")
    end
  end

  class Rook < Slider
    def initialize(color, square, board)
      super(color, square, board)
      @move_directions =  CARDINAL
    end

    def to_s
      @color == "white" ? "\u2656".encode("UTF-8") : "\u265C".encode("UTF-8")
    end
  end

  class Bishop < Slider
    def initialize(color, square, board)
      super(color, square, board)
      @move_directions =  DIAGONAL
    end

    def to_s
      @color == "white" ? "\u2657".encode("UTF-8") : "\u265D".encode("UTF-8")
    end
  end
end

# for pawns
# @color == "white" ? "\u2659".encode("UTF-8") : "\u265F".encode("UTF-8")