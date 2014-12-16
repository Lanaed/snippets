########################################################
# assertions
########################################################
# Q: how do these assertion functions work?  read and understand them
# - you definitely don't NEED to edit these functions to solve this challenge
# - but if you decide to change them to help you that's fine of course

def assert(actual)
  if actual
    print "."
  else
    raise "I expected something truthy, but I got #{actual}"
  end
end

def assert_equal(actual, expected)
  if expected == actual
    print "."
  else
    raise "I expected #{expected}, but I got #{actual}"
  end
end

def assert_false(actual)
  if actual
    raise "I expected something falsey, but I got #{actual}"
  else
    print "."
  end
end

def assert_empty(collection)
  if collection.empty?
    print "."
  else
    raise "derp."
  end
end