require_relative "boolean_array"
require_relative "singly_linked_list"

class StackEmptyException < Exception
  def initialize(stack)
    @stack = stack
  end

  def message
    "Stack is empty"
  end
end

class StackFullException < Exception
  def initialize(stack)
    @stack = stack
  end

  def message
    "Stack is full"
  end
end

class SinglyListStack
  def initialize
    # TODO
    @stack = SinglyLinkedList.new
  end

  def push(x)
    # returns self
    # TODO
    @stack << x
    self
  end

  def pop
    # returns the removed value
    # raises StackEmptyException if stack is empty
    # TODO
    raise StackEmptyException.new(@stack) if @stack.length == 0
    @stack.delete_at(@stack.length - 1)
  end
end

class BooleanArrayStack
  def initialize(size)
    # TODO
    @stack = BooleanArray.new(size)
  end

  def push(x)
    # returns self
    # raises StackFullException if stack is already full
    # TODO
    raise StackFullException.new(@stack) if @stack.length == @stack.used_length
    @stack << x
    self
  end

  def pop
    # returns the removed value
    # raises StackEmptyException if stack is empty
    # TODO
    raise StackEmptyException.new(@stack) if @stack.used_length == 0
    @stack.delete_at(@stack.used_length - 1)
  end
end
