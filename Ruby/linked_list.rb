class Node
  attr_accessor :val, :nxt

  def initialize(val, nxt)
    @val = val
    @nxt = nxt
  end
end

class List

  def initialize(val)
    #head currently pointing to nil
    @head = Node.new(val, nil)
  end

  def add_node(val)
    cur = @head
    #traverse to end of list and add there
    while (cur.nxt != nil)
      cur = cur.nxt
    end
    cur.nxt = Node.new(val, nil)
    self #so i can create them in a chain
  end

  def index(cur, value)
    # return index of the first node matching this value
    while (cur.nxt != nil && cur != nil)
      cur = cur.nxt
      #we want to check if the next node is the one we are looking for
      if cur.nxt.val == value #for later relinking purposes
        return cur
      end
    end
    return nil #cant find the matching index aka node

  end

  def del_a_value(value)
    cur = @head

    #case where we delete the head
    if (cur.val == value)
      @head = cur.nxt
      cur = nil
      return
    end

    #make sure there is a value to find
    if index(cur, value) == nil
      p "That val is not in the list"
      return
    end

    #delete the node
    delete_node(index(cur, value))

  end

#delete the node in front of cur
  def delete_node(cur)
    if (cur != nil) && (cur.nxt != nil)
      #skip node and link again
      cur.nxt = cur.nxt.nxt
    end

  end

  def show_list
    cur = @head

    while (cur.nxt != nil)
      print "Node: #{cur.val} , "
      cur = cur.nxt
    end
    #print last node which points to nil
    print "Node: #{cur.val}"
    puts
  end

end

#new list with val 10 at head
my_list = List.new(10)
my_list.add_node(3).add_node(4).add_node(6).add_node(45).add_node(2).add_node(11)
my_list.show_list
my_list.del_a_value(6)
my_list.show_list
my_list.del_a_value(4)
my_list.show_list
my_list.del_a_value(11)
my_list.show_list
my_list.del_a_value(10)
my_list.show_list

list_2 = List.new(2)
list_2.show_list
list_2.del_a_value(2)
