HEADERS = [:definition, :word]

class Card
  def initialize(args) # args is a hash with definition and word as key symbols, values as strings
  end

  def definition
  end

  #word reader
end

class Deck
  def initialize # blank array, no args
  end

  def add_card(card) #input is card object
  end

  def empty? #returns true/false
  end

  def get_next_card #returns a card object and modifies array
  end
end

module Parse
  def self.parse_text_file(file)

    data = File.read(file)
    data_array = data.split("\n\n")

    data_array.map! do |row|
      row.split("\n")
    end

    parsed_data = []
    data_array.each do |array|
      parsed_data << Hash[HEADERS.zip(array)]
    end

    parsed_data
  end
end

class Game
  include Parse

  def initialize(file) # input is text file
    @file = file
    @data = Parse.parse_text_file(file) #array of hashes from parser
    @count = 0
  end

  def play #returns score as string
    create_deck(@data)
    while !deck.empty?
      @current_card = @deck.get_card #return a card object
      @current_card.definition
      p "What is your guess?"
      @user_input = gets.chomp
      check_card
      end
    print_score
  end

  def create_deck(data) #returns array of card objects as a deck object
    @deck = Deck.new
    @data.each do |hash|
      @deck << Card.new(hash)
    end
    @deck
  end

  def match? #returns true/false
    @user_input == @current_card.word ? true : false
  end

  def check_card
    count += 1 if match?
  end

  def print_score
    puts "You got #{count} out of #{@data.length}"
  end

end


###TEST CODE
test_game = Game.new('flashcard_samples.txt')
# test_game.play

# p Parse.parse_text_file('flashcard_samples.txt')
