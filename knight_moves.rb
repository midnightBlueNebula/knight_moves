require_relative "next_moves"

class Knight_Moves
  attr_accessor :current
  def initialize
    @board = Array.new(8) { |r| r = Array.new(8) { |c| c = "| #{r+1}#{c+1} " } }
    @current_coord = [0,3]
    @current = Next_Moves.new(@current_coord)
    @current.assign_next_moves 
  end 

  def print_board(current=nil)
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
p a.current
