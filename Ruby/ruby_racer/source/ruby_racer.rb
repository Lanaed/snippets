require_relative 'racer_utils'

class RubyRacer
  attr_reader :players, :length

  def initialize(players, length = 30)

    @score = Array.new(players.length, 0)
    @players = players

    # score = Array.new(players.length,0)
    # @players = players
    # @players = Hash[@players.zip(score)]


    # @board = Array.new(players.length) { Array.new(30, "O")}

    # @board[0][0] = players[0]
    # @board[1][0] = players[1]

    # for i in 0...@board.length
    #   for j in 0...@board[0].length
    #     print @board[i][j] + " "
    #   end
    #   puts
    # end


  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    return @score.max > 30 ? true : false
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    return @players[@score.index(@score.max)]
  end

  # Rolls the dice and advances +player+ accordingly
  def advance_player!(player)
      @score[@players.index(player)] += Die.new.roll

  end

  # Prints the current game board
  # The board should have the same dimensions each time
  # and you should print over the previous board
  def print_board
    for i in 0...@players.length
        puts "Player #{@players[i]} : Score #{@score[i]}"
    end
  end

end

players = ['a', 'b']

game = RubyRacer.new(players)
# game.print_board
# game.advance_player!("a")
# game.advance_player!("b")
# game.print_board
# p game.winner
# p game.finished?

#This clears the screen, so the fun can begin
clear_screen!

until game.finished?
  players.each do |player|
    # This moves the cursor back to the upper-left of the screen
    move_to_home!

    # We print the board first so we see the initial, starting board
    game.print_board
    game.advance_player!(player)

    # We need to sleep a little, otherwise the game will blow right past us.
    # See http://www.ruby-doc.org/core-1.9.3/Kernel.html#method-i-sleep
    sleep(0.5)
  end
end

#The game is over, so we need to print the "winning" board
game.print_board

puts "Player '#{game.winner}' has won!"
