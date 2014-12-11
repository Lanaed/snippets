
# Your code here
def pig_latin(word)

  if 'aeiou'.include? word.downcase.split(//)[0]
    return word
  else

    piggy = word.split(//)

    piggy.length.times do
      if 'aeiou'.include? piggy[0]
        break
      else
        piggy.rotate!
      end
    end
  end

  return (piggy << "ay").join

end

print "Enter a sentence! "
userInput = gets.chomp
userInput.split(" ").each {|x|
  print pig_latin(x) + " "
}