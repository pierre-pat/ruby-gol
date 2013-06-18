require 'cell'

class World
	attr_accessor :grid

	def initialize size_world, size_cell
		@size_world, @size_cell = size_world, size_cell
		@num_cells = @size_world / @size_cell
		@grid = Array.new(@num_cells) do |x| 
					Array.new(@num_cells) do |y| 
						state = rand(6) < 2 ? 1 : 0
						Cell.new(x, y, state) 
					end
				end
	end

	def get_neighbors cell
		neighbors = []
		edge = @grid.length-1
		
		if cell.y-1 >= 0 then
			neighbors << @grid[cell.x-1][cell.y-1] if cell.x > 0 
			neighbors << @grid[cell.x][cell.y-1] 
			neighbors << @grid[cell.x+1][cell.y-1] if cell.x < edge
		end

		neighbors << @grid[cell.x-1][cell.y] if cell.x > 0
		neighbors << @grid[cell.x+1][cell.y] if cell.x < edge

		if cell.y+1 < edge then 
			neighbors << @grid[cell.x-1][cell.y+1] if cell.x > 0 
			neighbors << @grid[cell.x][cell.y+1]
			neighbors << @grid[cell.x+1][cell.y+1] if cell.x < edge
		end

		neighbors
	end

	def update
		@grid.each do |row|
			row.each do |cell|
				neighbors = get_neighbors(cell)
				cell.update(neighbors)
			end
		end

		@grid.each do |row|
			row.each do |cell|
				cell.state = cell.new_state
			end
		end
	end

end