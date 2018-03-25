require_relative "boolean_array"
require_relative "singly_linked_list"

class QueueEmptyException < Exception
  def initialize(queue)
    @queue = queue
  end

  def message
    "Queue is empty"
  end
end

class QueueFullException < Exception
  def initialize(queue)
    @queue = queue
  end

  def message
    "Queue is full"
  end
end

class SinglyListQueue
  def initialize
    @queue = SinglyLinkedList.new
  end

  def queue(x)
    # returns self
    # TODO
    @queue << x
    return self
  end

  def dequeue
    # returns the removed value
    # raises QueueEmptyException if queue is empty
    # TODO
    raise QueueEmptyException.new(@queue) if @queue.length ==0
    @queue.delete_at(0)
  end
end

class BooleanArrayQueue
  def initialize(size)
    # TODO
    @queue = BooleanArray(size)
    @start = 0
    @count = 0
  end

  def queue(x)
    # returns self
    # raises QueueFullException if queue is already full
    # TODO
    raise QueueFullException.new(self) if @count + 1 > @queue.length
    @queue[(@start + @count) % @queue.length] = x
    @count += 1
    return self
  end

  def dequeue
    # returns the removed value
    # raises QueueEmptyException if queue is empty
    # TODO
    raise QueueEmptyException.new(self) if @count < 1
    item = @queue[@start]
    @start = (@start + 1) % @queue.length
    @count -= 1
    return item
  end
end

x = SinglyListQueue.new
x.queue(5)
x.queue(4)
x.queue(3)
x.queue(2)
p x.dequeue
p x.dequeue
p x.dequeue
p x.dequeue