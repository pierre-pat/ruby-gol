require 'cell'
require 'world'
require 'ruby-processing'

class GameOfLife < Processing::App

	def setup
		size(400, 400)
		frame_rate(2)

		@size_cell = 25
		@world = World.new width, @size_cell
	end

	def draw
		background(255)

		@world.update 

		draw_grid

		fill(0)
		(0...@world.grid.length).each do |x|
			(0...@world.grid.length).each do |y|
				if @world.grid[x][y].state == 1 
					rect(x*@size_cell, y*@size_cell, @size_cell, @size_cell) 
				end
			end
		end

	end

	def mouse_pressed
		x = mouse_x / @size_cell
		y = mouse_y / @size_cell
		@world.grid[x][y].state = 1
		rect(x*@size_cell, y*@size_cell, @size_cell, @size_cell) 
	end

	def draw_grid
		push_matrix
		stroke(120)
		(0...width).step(@size_cell).each do |start|
			line(start, 0, start, height)
			line(0, start, width, start)
		end

		pop_matrix
	end
end
