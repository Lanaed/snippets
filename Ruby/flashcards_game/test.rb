DATABASE_NAME = 'flashcards_db'
require 'sqlite3'

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

# entire_file = []
# f = File.open("flashcard_samples.txt", "r")
# f.each_line do |line|
#     entire_file.push(line.chomp!) unless line.chomp.empty?
# end
# h = Hash[*entire_file]

db_connection.execute(<<-SQL
  insert into flashcards (answer, question)
  values ('break', 'Gives an unconditional termination to a code block, and is usually placed with an argument');
  SQL
  )

p db_connection.execute(<<-SQL
  select * from flashcards
  SQL
  )


# h.each do |k, v|

# end

