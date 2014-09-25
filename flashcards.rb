class Card

  attr_reader :front, :back

  def initialize(front, back)
    @front = front
    @back = back
  end

  def play
    ask_question
    check_answer
  end

  private

  def ask_question
    puts "What is the correct translation of '#{front}'?"
    @answer = gets.chomp
  end

  def check_answer
    if @answer.downcase == back.downcase
      puts "That is correct!"
    else
      puts "Sorry, the correct answer is '#{back}'."
    end
  end
end

class Deck

  attr_reader :name, :cards

  def initialize(name, cards)
    @name = name
    @cards = cards
  end

  def play
    deck_intro
    cards.shuffle.each do |card|
      card.play
    end
  end

  private

  def deck_intro
    puts "-----"
    puts "Here is the #{name} deck:"
    puts "-----"
  end
end

class Game

  attr_reader :decks

  def initialize(decks)
    @decks = decks
  end

  def play
    welcome
    begin
      choose_language
      which_deck
    end while !@language_choice.empty?
    ending
  end

  private

  def welcome
    message = "Welcome to the flash card game!"
    puts message
    puts "-" * message.length
   end

  def choose_language
    puts "(Hit enter if you want to exit.)"
    puts "Decks:"
    decks.each do |deck|
      puts deck.name
    end
    puts "Which of the above languages would you like to practice?"
    @language_choice = gets.chomp.downcase
  end

  def which_deck
    decks.each do |deck|
      @language = deck.name
      if @language_choice == @language.downcase
        deck.play
      end
    end
  end

  def ending
    puts "Thanks for playing! Keep practicing!"
  end
end

class Reader

  def initialize(filename)
    @file = File.open(filename)
  end

  def decks
    deck_number = @file.gets.to_i
    deck_number.times.map do |row|
      name = @file.gets.chomp
      @cards_number = @file.gets.to_i
      cards = get_cards
      deck = Deck.new(name, cards)
    end
  end

  def get_cards
    @cards_number.times.map do |row|
      front = @file.gets.chomp
      back = @file.gets.chomp
      card = Card.new(front, back)
    end
  end
end

# german_cards = [Card.new("ein Hund", "dog")]
# german_cards << Card.new("eine Frau", "woman")
# german_cards << Card.new("ein Lehrer", "teacher")

# spanish_cards = [Card.new("gato", "cat")]
# spanish_cards << Card.new("libro", "book")
# spanish_cards << Card.new("escuela", "school")

# serbian_cards = [Card.new("grad", "city")]
# serbian_cards << Card.new("rečnik", "dictionary")
# serbian_cards << Card.new("mleko", "milk")

# decks = [Deck.new("German", german_cards)]
# decks << Deck.new("Spanish", spanish_cards)
# decks << Deck.new("Serbian", serbian_cards)

deck_reader = Reader.new("decks")
decks = deck_reader.decks

game = Game.new(decks)
game.play