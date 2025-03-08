#Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.
#Think about how you would set up the different elements within the game...What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.
#Build your game, taking care to not share information between classes any more than you have to.
#Post your solution below

class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    @board.each { |row| puts row.join(' | ') }
  end

  def empty?(row, col)
    @board[row][col] == ' '
  end

  def mark(row, col, mark)
    @board[row][col] = mark
  end

  def winner?(mark)
    @board.any? { |row| row.all?(mark) } ||
    @board.transpose.any? { |col| col.all?(mark) } ||
    [@board[0][0], @board[1][1], @board[2][2]].all?(mark) ||
    [@board[0][2], @board[1][1], @board[2][0]].all?(mark)
  end
end

class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def move
    print 'Enter row and column: '
    gets.chomp.split.map(&:to_i)
  end
end

class Game
  def initialize
    @board = Board.new
    @players = [Player.new('X'), Player.new('O')]
    @current_player = 0
  end

  def play
    loop do
      @board.display
      row, col = @players[@current_player].move
      if @board.empty?(row, col)
        @board.mark(row, col, @players[@current_player].mark)
        if @board.winner?(@players[@current_player].mark)
          @board.display
          puts 'Game over!'
          puts "Player #{@current_player + 1} wins!"
          break
        end
        @current_player = (@current_player + 1) % 2
      else
        puts 'Invalid move!'
      end
    end
  end
end

Game.new.play