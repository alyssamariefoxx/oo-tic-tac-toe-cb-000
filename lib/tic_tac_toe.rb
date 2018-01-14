class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # botton row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # left diag
    [2,4,6], # right diag
  ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end



  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def move(index, current_player = "X")
     @board[index] = current_player
   end

   def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def full?
     @board.none?{ |space| space == " "}
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      if (@board[win[0]]) == "X" && (@board[win[1]]) == "X" && (@board[win[2]]) == "X" || (@board[win[0]]) == "O" && (@board[win[1]]) == "O" && (@board[win[2]]) == "O"
        return win
      end
    end
  end

  def draw?
    won? == nil && full? == true
  end

  def over?
    won? || full? || draw?
  end

  def winner
    WIN_COMBINATIONS.detect do |win|
      if (@board[win[0]]) == "X" && (@board[win[1]]) == "X" && (@board[win[2]]) == "X"
        return "X"
      elsif (@board[win[0]]) == "O" && (@board[win[1]]) == "O" && (@board[win[2]]) == "O"
        return "O"
      end
    end
  end

  def play
    until over? 
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif
        puts "Cat's Game!"
      end
  end
end
