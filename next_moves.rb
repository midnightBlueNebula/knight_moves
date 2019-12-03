class Next_Moves
  attr_accessor :current, :next_moves
  def initialize(current)
    @current = current
    @next_moves = []
  end 

  def assign_next_moves(current=@current,visited=[])
    return if visited.length >= 64 
    visited << current 
    row = current[0]
    col = current[1]
    pot_moves = [[row+1,col+2],[row-1,col+2],[row+1,col-2],[row-1,col-2],[row+2,col+1],[row-2,col+1],[row+2,col-1],[row-2,col-1]]
    pot_moves.each do |m|
      @next_moves << Next_Moves.new(m) if m.all? { |i| i < 8 && i >= 0 } && visited.include?(m) == false 
    end
    @next_moves.each { |n| n.assign_next_moves(n.current,visited) }
  end
end 
