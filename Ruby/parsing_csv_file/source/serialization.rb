require 'csv'

class Person

  attr_reader :id, :first_name, :last_name, :email, :phone, :created_at

  def initialize(id, first_name, last_name, email, phone, created_at)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end
  # Look at the above CSV file
  # What attributes should a Person object have?
end

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
    @people = []
    self.parse
  end

  def parse
    CSV.foreach(@file) do |row|
      @people << row
    end
  end

  def people
    # p @people
    # @people = @file.split(",")
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    return @people if @people

    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
  end

  def add_person(person)
    @people << [person.id, person.first_name, person.last_name, person.email, person.phone, person.created_at]
  end

  def save
    # do some shenanigans here
    CSV.open("test.csv", "a") do |csv|
      p @people
      @people.each do |row|
        csv << row
      end
    end
  end

end

parser = PersonParser.new('people.csv')
parser.people
parser.add_person(Person.new("201","Dev","Bootcamp","dbc@devbootcamp.edu","1-702-580-4785","2012-02-22T10:09:03-09:00"))
parser.save
# puts "There are #{parser.people.size} people in the file '#{parser.file}'."
