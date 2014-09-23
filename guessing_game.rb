class GuessingGame
  ROUNDS = 5
  def initialize
    @wins = 0
    @guesses = 0
  end
  def play
    welcome
    ROUNDS.times do
      @round = Round.new
      @round.play
      stat_counter
    end
    ending
  end
  def welcome
    puts "-----"
    puts "Welcome to the game!"
  end
  def stat_counter
    if !@round.incorrect?
      @wins = @wins + 1
    end
    @guesses = @guesses + @round.round_guesses
  end
  def ending
    puts "-----"
    puts "Number of wins out of 5 rounds: #{@wins}"
    puts "Average number of guesses per round: #{@guesses / ROUNDS.to_f}"
  end
end

class Round
  def initialize
    @rand_number = rand(10) + 1
    @guesses = 0
  end
  def play
    start_round
    3.times do
      @guesses = @guesses + 1
      round_guesses
      get_guess
      check_answer
      break if !incorrect?
    end
  end
  def start_round
    puts "-----"
    puts "Guess which number I'm thinking - enter a number between 1 and 10!"
  end
  def round_guesses
    @guesses
  end
  def get_guess
    @player_guess = gets.chomp.to_i
  end
  def check_answer
    if incorrect?
      puts "Sorry, not correct!"
    else
      puts "Congrats, your answer is correct!"
    end
  end
  def incorrect?
    @rand_number != @player_guess
  end
end

game = GuessingGame.new
game.play