class Hospital

  attr_accessor :records

  def initialize
    @records = {
      patients: [],
      doctors: [],
      janitors: [],
      receptionists: []
    }
  end

  def add_patient(first_name, last_name, gender, patient_id)
    @records[:patients] << Patient.new(first_name, last_name, gender, patient_id)
  end

  def add_doctor(first_name, last_name, gender, employee_id)
    @records[:doctors] << Doctor.new(first_name, last_name, gender, employee_id)
  end

  def add_janitor(first_name, last_name, gender, employee_id)
    @records[:janitors] << Janitor.new(first_name, last_name, gender, employee_id)
  end

  def add_receptionist(first_name, last_name, gender, employee_id)
    @records[:receptionists] << Receptionist.new(first_name, last_name, gender, employee_id)
  end
end


class People
  def initialize(first_name, last_name, gender)
    @first_name = first_name
    @last_name = last_name
    @gender = gender
  end
end

class Employee < People
  attr_accessor :employee_id
  def initialize(first_name, last_name, gender, employee_id)
    super(first_name, last_name, gender)
    @employee_id = employee_id
  end
end

class Doctor < Employee
  def initialize(first_name, last_name, gender, employee_id)
    super
  end
end

class Receptionist < Employee
  def initialize(first_name, last_name, gender, employee_id)
    super
  end
end

class Janitor < Employee
  def initialize(first_name, last_name, gender, employee_id)
    super
  end
end


class Patient < People
  attr_accessor :patient_id
  def initialize(first_name, last_name, gender, patient_id)
   super(first_name, last_name, gender)
   @patient_id = patient_id
    # patient_id
    # patient_record
  end
end



#----------- TEST----------------

# pat = Receptionist.new("ethan", "spiro", "m", 456385)
# p pat

h = Hospital.new
# a = Administrator.new
h.add_patient("ethan", "spiro", "m", 456385)
h.add_doctor("a", "b", "m", 454485)
h.add_receptionist("c", "d", "m", 459985)
h.add_janitor("e", "f", "m", 456385)
h.add_doctor("p", "o", "m", 456385)
p h.records

# h.records[:patients].each do |x|
#   p x.patient_id.to_s.include? user_id
# end
user_id = 456385
# h.records.each do |k, v|
#   v.each do |x|
#     if k == :patients ...ended here
#     if x.patient_id.to_s == user_id
#       p "found it"
#     end
#     if x.employee_id.to_s == user_id && x.employee_id
#       p "found it"
#     end
#   end
# end

# --------------- INTERFACE ----------
# p "Hi welcome to the hospital"
# print "Enter id : "
# user_id = gets.chomp!
# if user_id ==


