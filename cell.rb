class Cell
  attr_accessor :state, :new_state, :x, :y

  def initialize(x, y, state=0)
  	@x, @y, @state = x, y, state
  end

  def update(neighbors)
  	living_neighbors = neighbors.select{ |c| c.state == 1 }

  	if @state == 0 && living_neighbors.length >= 3 then
  		@new_state = 1
  	elsif @state == 1 && (living_neighbors.length >= 5 || living_neighbors.length <= 1)
  		@new_state = 0
      puts "num of living neighbor: #{living_neighbors.length}"
  	end
  end

end