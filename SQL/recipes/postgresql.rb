# ---------------------------------------
# ---------------------------------------
# Introduction:
#
# this file is all you need to create a database, setup that database,
# connect to it and interact with it using PostgresSQL (assuming you've
# already installed PostgreSQL and the server is running, of course)
#
# if you're not sure what this is about, just keep reading and try running
# this script, look at the output and think about what's happening.
#
# if you're already comfortable with all of this, good for you.  rejoice!
# ---------------------------------------
# ---------------------------------------

DATABASE_NAME = 'ethan_ryan'

require 'pg'
require 'faker'

ignore_errors = "/dev/null 2>&1" # this is a little helper for the line below
`createdb #{DATABASE_NAME} #{ignore_errors}`

db_connection = PG.connect( dbname: DATABASE_NAME )
db_connection.exec("drop table if exists recipes_ingredients;")
db_connection.exec("drop table if exists recipes;")
db_connection.exec("drop table if exists chefs;")
db_connection.exec("drop table if exists ingredients;")

# you don't need to use the word SQL below.  it's a "heredoc" (read about it) in Ruby
# that lets you declare multi-line string variables.  we use <<-SQL ... SQL  to specify
# the heredoc so that Sublime notices it and highlights the contents as SQL
db_connection.exec(<<-SQL
  create table chefs (
    id SERIAL PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255)
    );
SQL
)
db_connection.exec(<<-SQL
  create table recipes (
    id SERIAL PRIMARY KEY,
    instructions varchar(255),
    author_id int REFERENCES chefs (id)
    );
SQL
)
db_connection.exec(<<-SQL
  create table ingredients (
    id SERIAL PRIMARY KEY,
    name varchar(255)
    );
SQL
)
db_connection.exec(<<-SQL
  create table recipes_ingredients (
    id SERIAL PRIMARY KEY,
    recipes_id int REFERENCES recipes (id),
    ingredients_id int REFERENCES ingredients (id),
    quantity int
    );
SQL
)

# ---------------------------------------
# Display
# ---------------------------------------
def display(query, db_connection)
  results = db_connection.exec(query)
  results.each do |x|
    print x.values.join("\t")
    puts
    puts "-"*30
  end
  puts
end

# ---------------------------------------
# INSERT
# ---------------------------------------
puts "-"*50
print "inserting some data ... "

counter = 1
10.times do
  # it could have been this simple, for example.  the goal is to escape apostrophes
  fn = Faker::Name.first_name.gsub("'", "''")
  ln = Faker::Name.last_name.gsub("'", "''")
  ing = Faker::Lorem.word.gsub("'", "''")
  inst = Faker::Lorem.words(8).join(" ").gsub("'", "''")

  db_connection.exec(<<-SQL
    insert into chefs (first_name, last_name)
    values ('#{fn}', '#{ln}');
    SQL
    )
  db_connection.exec(<<-SQL
    insert into ingredients (name)
    values ('#{ing}');
    SQL
    )
  db_connection.exec(<<-SQL
    insert into recipes (instructions, author_id)
    values ('#{inst}', '#{counter}');
    SQL
    )
  db_connection.exec(<<-SQL
    insert into recipes_ingredients (recipes_id, ingredients_id, quantity)
    values ('#{counter}', '#{counter}', '#{rand(1..100)}');
    SQL
    )

  counter += 1

end

puts "done."

display("select * from chefs;", db_connection)
display("select * from ingredients;", db_connection)
display("select * from recipes;", db_connection)
display("select * from recipes_ingredients;", db_connection)
display("select first_name, last_name, instructions from chefs inner join recipes on recipes.author_id = chefs.id where recipes.id = 2", db_connection)


# ---------------------------------------
# SELECT
# ---------------------------------------
puts "-"*50
print "Running some queries"
puts

display("select first_name, last_name, instructions from chefs inner join recipes on recipes.author_id = chefs.id where recipes.id = 2", db_connection)

# ---------------------------------------
# UPDATE
# ---------------------------------------
puts "-"*50
print "Updating Data"
puts

# update the table
db_connection.exec(<<-SQL
  update chefs
  set first_name = 'Homer', last_name = 'Simpson'
  where id = 4;
  SQL
  )

display("select * from chefs ORDER BY id asc;", db_connection)

# ---------------------------------------
# DELETE
# ---------------------------------------
puts "-"*50
print "Deleting some data"

# update the table
# db_connection.exec(<<-SQL
#   delete from chefs
#   where id = 6;
#   SQL
#   )

display("select * from chefs;", db_connection)

# verify that the data was changed


puts "and done."
