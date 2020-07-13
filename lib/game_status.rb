# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #mid row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #mid column
  [2,5,8], #right column
  [0,4,8], # diag 1
  [2,4,6]  #diag 2
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]
    
    pos1 = board[win_index1]
    pos2 = board[win_index2]
    pos3 = board[win_index3]
    
    if (pos1 == "X" && pos2 == "X" && pos3 == "X") ||  (pos1 == "O" && pos2 == "O" && pos3 == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  board.all?{|x| x == "X" || x == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end