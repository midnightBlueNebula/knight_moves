require_relative "next_moves"

$board = []

class Knight_Moves
  attr_accessor :current_chain
  def initialize(current_coord=[0,3],target_coord=[2,5])
    @board = Array.new(8) { |r| r = Array.new(8) { |c| c = "| #{r+1}#{c+1} " } }
    $board = Array.new(8) { |r| r = Array.new(8) { |c| c = [r,c] } }
    @current_coord = current_coord 
    @target_coord = target_coord
    @current_chain = Next_Moves.new(@current_coord,@target_coord)
    @current_chain.assign_next_moves 
  end 

  def print_board(current=@current_coord)
    @board.each do |r|
      r.each do |c|
        if c == current
          print "| K " 
        else
          print c 
        end  
      end 
      print " |\n"
      p "-"*8
    end 
  end 

end 

a = Knight_Moves.new







 
