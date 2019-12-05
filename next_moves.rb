$tracks = []
$min = 168 
$min_track = []

class Next_Moves
  attr_reader :current, :next_moves
  def initialize(current,target)
    @current = current
    @next_moves = []
    @target = target
  end 

  def assign_next_moves(current=@current,visited=[])
    p $min_track if $tracks.length > 10000
    return if $tracks.length > 10000 || visited.length > $min
    visited << current 
    if current == @target
      if visited.length < $min && $tracks.include?(visited) == false
        $tracks << visited
        p visited
        $min_track = visited
        $min = $min_track.length
      elsif $tracks.include?(visited) == false
        $tracks << visited
      end
      visited.pop()
      return 
    end 
    row = current[0]
    col = current[1]
    pot_moves = [[row+1,col+2],[row-1,col+2],[row+1,col-2],[row-1,col-2],[row+2,col+1],[row-2,col+1],[row+2,col-1],[row-2,col-1]]
    pot_moves.each do |m|
      @next_moves << Next_Moves.new(m,@target) if m.all? { |i| i < 8 && i >= 0 } && visited.include?(m) == false 
    end
    @next_moves.each { |n| n.assign_next_moves(n.current,visited.slice(0,visited.length)) }
  end
end 


