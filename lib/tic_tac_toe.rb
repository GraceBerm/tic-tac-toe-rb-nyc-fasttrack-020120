def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, value = "X")
  board[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Third column
  [0,4,8],  # Left diagonal
  [2,4,6]   # Right diagonal
]

# board = ["X", " ", " ", "X", " ", " ", "X", " ", " "]
def won?(board)
  won_combination = false

  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X")
       won_combination = win_combination
    elsif (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
       won_combination = win_combination
     end
  end
won_combination
end

def full?(board)
  board.all? do |board_spot|
    board_spot == "X" || board_spot == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winner = nil
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X")
       winner = "X"
    elsif (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
       winner = "O"
     end
  end
  winner
end
