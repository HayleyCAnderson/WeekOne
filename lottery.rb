class Lottery

	def initialize
		@lottery_pool = []
	end

	def play
		welcome
		get_names
		choose_winner
	end

	def welcome
		puts "Welcome to the lottery!"
		puts "Enter in a list of names followed by a blank line to start the lottery"
	end

	def get_names
		print "> "
		name = gets.chomp
		while name != ""
			@lottery_pool.push name
			print "> "
			name = gets.chomp
		end
	end

	def choose_winner
		lottery_size = @lottery_pool.length
		winner = rand(lottery_size + 1)
		puts 
		puts "#{@lottery_pool[winner]} wins!"
	end

end

lottery = Lottery.new
lottery.play