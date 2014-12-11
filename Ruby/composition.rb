# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here

class Cookie
  attr_accessor :status
  def initialize(diameter)
    @diameter = diameter
    @status = :doughy
  end
end

class Pb_cookie < Cookie
  attr_accessor :done
  def initialize(diameter)
    super(diameter)
    @ingredient = "peanut"
    @done = 13
  end
end

class Sugar_cookie < Cookie
  attr_accessor :done
  def initialize(diameter)
    super(diameter)
    @ingredient = "sugar"
    @done = 10
  end
end

class Choc_cookie < Cookie
  attr_accessor :done
  def initialize(diameter)
    super(diameter)
    @ingredient = "chocolate chip"
    @done = 8
  end
end

class Tray
  attr_accessor :arr_of_cookies
  def initialize(*args)
    @arr_of_cookies = args
  end
end

class Oven
  def initialize
    p "Hey created oven"
  end

  def cook(tray, time)
    tray.arr_of_cookies.each do |cookie|
      if time > cookie.done
        cookie.status = :burned
      elsif time == cookie.done
        cookie.status = :ready
      else
        cookie.status = :doughy
      end
     end
   end
end

## TEST ##

t = Tray.new(Choc_cookie.new(2), Pb_cookie.new(2))

o = Oven.new
p o.cook(t, 10)
