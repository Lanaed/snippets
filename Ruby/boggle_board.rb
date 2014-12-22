

def assert
  raise "Assertion failed!!" unless yield
end

class BoggleBoard

  attr_reader :boggle_board

  def initialize(bboard)
    @boggle_board = bboard
  end

  def get_row(row)
    return @boggle_board[row]
  end

  def get_col(col)
    return @boggle_board.transpose[col] #flip on side
  end

  def get_diagonal(row, col, ud, lr)

    diagWord = []

    #make sure paramters are correct and bounds are correct
    assert {((ud == "up" || ud == "down") && (lr == "left" || lr == "right"))}
    assert {row >= 0 && row < @boggle_board.length && col >= 0 && col < @boggle_board.length}

    loop do
      #while there are more get_diagonal characters to print
      if (row < 0 || row > @boggle_board.length-1 || col < 0 || col > boggle_board.length-1)
        break
      end
      diagWord.push(@boggle_board[row][col])
      #get_diagonal right down
      if (ud == "down" && lr == "right")
        row += 1
        col += 1
      #get_diagonal left down
      elsif (ud == "down" && lr == "left")
        row += 1
        col -= 1
      #get_diagonal up right
      elsif (ud == "up" && lr == "right")
        row -= 1
        col += 1
      #get_diagonal up left
      else
        row -= 1
        col -= 1
      end
    end #end for

    return diagWord

  end

  def create_word(*coords)
    p coords.map { |coord| @boggle_board[coord.first][coord.last]}.join("")
  end

end


dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]

boggle_board = BoggleBoard.new(dice_grid)

p boggle_board.get_diagonal(0, 2, "down", "left").join #=>prints aoe
p boggle_board.get_diagonal(3, 3, "up", "left").join #=>prints elob
#boggle_board.get_diagonal(5, 2, "up", "left") #=>assertion fails!
#boggle_board.get_diagonal(2, 2, "up", "bacon") #=>assertion fails!

# create driver test code to retrieve a value at a coordinate here:

p boggle_board.boggle_board[0][0] #=>prints b

# implement tests for each of the methods here:

#printing all rows and columns
for i in 0...boggle_board.boggle_board.length
  print "Row #{i + 1} = " + boggle_board.get_row(i).join + "\n"
  print "Column #{i + 1} = " + boggle_board.get_col(i).join + "\n"
end
=begin
prints:
Row 1 = brae
Column 1 = biet
Row 2 = iodt
Column 2 = roca
Row 3 = eclr
Column 3 = adlk
Row 4 = take
Column 4 = etre
=end

assert {BoggleBoard.instance_method(:initialize).arity == 1} #=>pass
assert {BoggleBoard.instance_method(:get_row).arity == 1} #=>pass
assert {BoggleBoard.instance_method(:get_col).arity == 1} #=>pass
assert {boggle_board.boggle_board[0][0] == "b"} #=>pass
assert {boggle_board.boggle_board[3][2] == "k"} #=>pass
#assert {boggle_board.boggle_board[0][3] == "z"} #=>fail
assert {boggle_board.create_word([0,0],[1,1],[1,2],[0,3]) == "bode"} #=>pass
