require 'curses'
# include Curses

require_relative 'Menu.class.rb'
require_relative 'Racket.class.rb'
require_relative 'Ball.class.rb'

Curses.init_screen
Curses.start_color
Curses.noecho
Curses.curs_set(0)  # Invisible cursor
# Curses.crmode
# Curses.nonl

Curses.init_pair(1, Curses::COLOR_BLACK, Curses::COLOR_WHITE)
Curses.init_pair(2, Curses::COLOR_BLACK, Curses::COLOR_YELLOW)
Curses.init_pair(3, Curses::COLOR_YELLOW, Curses::COLOR_BLACK)
WHITE = Curses.color_pair(1)
YELLOW = Curses.color_pair(2)
BALL = Curses.color_pair(3)


begin
	# On initialise le jeu

	racket = Racket.new
	ball = Ball.new(racket)
	racket.ball = ball
	
	Curses.stdscr.refresh

	while ch = Curses.stdscr.getch
		Curses.stdscr.clear
		Curses.stdscr.setpos(0, 0)
		Curses.stdscr.addstr("#{ch}")
		case ch
			when ' '
				# On libere la balle
			when 's'
				racket.speed = 10
			when 'q'
				racket.move_left
			when 'd'
				racket.move_right
			when 27
				break
			else
				racket.draw
		end
	end

ensure
	Curses.close_screen
end
