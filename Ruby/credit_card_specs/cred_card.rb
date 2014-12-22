class CreditCard

  def initialize(number)
    if (number.to_s.length != 16)
       raise ArgumentError.new("Incorrect digits")
    end
    @number = number
    @sum = 0
  end #end initialize

  def check_card
    luhns()
    if (@sum % 10 == 0)
      return true
    else
      return false
    end
  end #end check card

  private
  def luhns

    digArr = @number.to_s.reverse.split(//).map(&:to_i)

    for i in 1...digArr.length
      if (i % 2 != 0)
        digArr[i] *= 2
      end
    end

    for i in 0...digArr.length
      if(digArr[i] > 9)
        digArr[i] = (digArr[i].to_s.split(//).map(&:to_i))
        digArr.flatten!
      end
    end

    for i in 0...digArr.length
      @sum += digArr[i]
    end

  end #end luhns

end #end class

vCard = CreditCard.new(4408041234567893)
if (vCard.check_card == true)
  p "Valid Card"
else
  p "Invalid Card"
end

#invalid card from rspec
ivCard = CreditCard.new(4408041234567892)
if (ivCard.check_card == true)
  p "Valid Card"
else
  p "Invalid Card"
end
