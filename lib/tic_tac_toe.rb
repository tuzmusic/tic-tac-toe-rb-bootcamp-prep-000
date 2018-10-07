# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(b)
  line = "-----------"
  puts(" #{b[0]} | #{b[1]} | #{b[2]} ")
  puts(line)
  puts(" #{b[3]} | #{b[4]} | #{b[5]} ")
  puts(line)
  puts(" #{b[6]} | #{b[7]} | #{b[8]} ")
end

def input_to_index(i)
  i.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def valid_move? (board, index)
  return index.between?(0, board.size) && !position_taken?(board, index)
end

def turn(board, index)
  if valid_move?(board, index)
    move(board, index, "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |spot|
    counter += (spot != " " && spot !="") ? 1 : 0
  end
  return counter
end

def current_player(board)
  return turn_count(board) % 2 == 0 ? "X" : "O"
end

def play(board)
  puts("Please enter 1-9:")
  index = input_to_index(gets.strip)
  turn(board, index)
  if over?(board)
    turn(board, index)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |winRow|
    winRow.all? {|spot| board[spot] == "X"} || winRow.all? {|spot| board[spot] == "O"}
  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  if winner = won?(board)
    return board[winner[0]]
  end
end
