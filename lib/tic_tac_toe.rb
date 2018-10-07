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
