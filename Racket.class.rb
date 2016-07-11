class Racket
	attr_accessor :speed
	attr_accessor :width
	attr_accessor :ball
	attr_accessor :x
	RACKET_Y = Curses.stdscr.maxy - 3

	def initialize
		@width = 9
		@speed = 2
		@x = Curses.stdscr.maxx / 2
		draw
	end

	def draw
		Curses.stdscr.attrset(WHITE)
		Curses.stdscr.setpos(RACKET_Y, @x - @width / 2)
		@width.times do
			Curses.stdscr.addstr(" ")
		end
	end

	def move_left
		@x -= @speed
		if @ball
			@ball.move_left
		end
		draw
	end

	def move_right
		@x += @speed
		if @ball
			@ball.move_right
		end
		draw
	end

end