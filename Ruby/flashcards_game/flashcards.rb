# Main file for

require 'sqlite3'
#Model
module Model
  class DBConnection
    def self.access_db
      DATABASE_NAME = 'flashcards_db'

      db_connection = SQLite3::Database.new "#{DATABASE_NAME}.db"

      db_connection.execute("drop table if exists flashcards;")

      db_connection.execute(<<-SQL
        create table flashcards
        (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          answer  VARCHAR(255) NOT NULL,
          question VARCHAR(255) NOT NULL
          );
      SQL
      )

      db_connection.execute(<<-SQL
        insert into flashcards (answer, question)
        values ('break', 'Gives an unconditional termination to a code block, and is usually placed with an argument');
        SQL
        )
    end
  end

  class Card
    attr_reader :question, :answer
    def initialize(row)
    #create card from row
  end
end

class Deck

  def initialize()
    @array=[]
    #for each row send row to card class to create new card object
  end
  def get_Data_from_DB
    # Will get the data from DB and intialize the array on the deck
  end
end
end

#View
class View
  def self.show_question
    #     Definition
    # A file format in which values are delimited by commas.
    # Guess: YAML
    # returns get.chomps
  end
  def self.show_correct_answer
    # Guess: CSV
    # Correct!
  end
  def self.show_incorrect_answer
     # Incorrect!  Try again.
   end
   def self.finish_game
     # Print the game finish
   end
   def self.show_first_line
    p "Welcome to Ruby Flash Cards. To play,
    just enter the correct term for each definition."
  end
end

#Controller
class Controller
  def initialize(view)
    @view=view
    @model=model
  end
  def show
    @view.show_first_line
  end
end


c=Controller.new(View,Deck.new(array))
c.show

