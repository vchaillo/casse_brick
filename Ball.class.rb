class Ball
	attr_accessor :x
	attr_accessor :y
	attr_accessor :speed
	attr_accessor :visible
	attr_accessor :attach

	def initialize(racket)
		@x = racket.x
		@y = Racket::RACKET_Y - 1
		# racket.ball = self
		@speed = racket.speed
		@visible = true
		@attach = true
		draw
	end

	def draw
		Curses.stdscr.attrset(BALL | Curses::A_BOLD)
		Curses.stdscr.setpos(@y, @x)
		Curses.stdscr.addstr("0")
	end

	def move_left
		@x -= @speed
		draw
	end

	def move_right
		@x += @speed
		draw
	end
end