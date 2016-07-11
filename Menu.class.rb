# require 'curses'
# include Curses

class Menu
	MENU_LINES = 3
	MENU_COLS = Curses.stdscr.maxx

	attr_accessor :win

	def initialize
		@win = Curses::Window.new(MENU_LINES, MENU_COLS, 0, 0)
		@win.refresh
	end

	def draw_menu
		Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_WHITE)
		@win.attrset(Curses.color_pair(1) | Curses::A_BOLD)

		MENU_LINES.times do |y|
			MENU_COLS.times do |x|
				@win.setpos(y, x)
				@win.addstr(" ")
			end
		end

		@win.setpos(1, 2)
		@win.addstr("Casse Briques")
		# draw_score

		@win.refresh
	end
end
