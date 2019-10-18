class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    print "-----------"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    print "-----------"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    index.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position_taken?(position) | !@board[position]
      false
    else
      true
    end
  end

  def turn
    input = gets
    input = input_to_index(input)
    if valid_move?(input)
      move(input, token = "X")
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.select do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    if position_taken?(win_index_1) && position_taken?(win_index_2) && position_taken?(win_index_3)
      if (@board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X") || (@board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O")
        return combo
      end
    end
  end
  return false
  end

  def full?
    @board.all? do |value|
      value == "X" || value == "O"
    end
  end
end
