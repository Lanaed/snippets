
class Student < ActiveRecord::Base
# implement your Student model here

def name
  return first_name + " " + last_name
end

#passing
def age
  return (Date.today - birthday).to_i/365
end

validates_format_of :email, { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Invalid email entry" }
validates :email, { :uniqueness => true }

validate :no_toddlers
validate :phone_validation
#age must be atleast 5

def no_toddlers
  if age < 5
    errors.add(:birthday, "You are too young!")
  end
end

def phone_validation
  #http://www.developer.com/db/article.php/3712756/Advanced-Active-Record-Validations-with-Rails.htm
  if self.phone.gsub(/[^0-9]/, "").length < 10
    errors.add(:phone, "Invalid phone number!")
  end
end

end