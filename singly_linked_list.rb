require_relative "index_out_of_bounds_exception"
require_relative "wrong_list_exception"

class SinglyLinkedListItem
  attr_accessor :object, :next
  attr_reader :list

  def initialize(object, list)
    @object = object
    @list = list
  end
end

class SinglyLinkedList
  attr_reader :length

  # constructor
  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end

  private

  # get_item(i)
  # returns the SinglyLinkedListItem at given index
  def get_item(index)
    # TODO
    i = 0
    item = @head
    continue = true
    while continue
      if i == index
        continue = false
      else
        item = item.next
        i += 1
      end
    end
    return item
  end

  public

  # get(i)
  # returns the value (object) at given index
  def [](index)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # TODO
    raise IndexOutOfBoundsException.new(index, @length) if index < 0 || index >= @length
    get_item(index).object
  end

  # set(i, value)
  # always returns value
  def []=(index, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # TODO
    raise IndexOutOfBoundsException.new(index, @length) if index < 0 || index > @length
    item = get_item(index)
    item.object = object
    @length = (index + 1) if index >= @length

  end

  # find(value)
  # returns the first list item with the @object equal to object, or nil if this value is not found
  def find(object)
    # TODO
    item = @head
    result = nil
    @length.times do |i|
      if item.object == object
        result = item
        break
      else
        item = item.next
      end
    end
    return result
  end

  # iterate(callback)
  # as you have not covered yield in the Ruby course, this is already done
  def each
    if @length > 0
      item = @head
      begin
        yield item.object
        item = item.next
      end until item.nil?
    end
  end

  # insert_before(item, value)
  # returns the new list item
  def insert_before(item, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # TODO
  end

  # insert_after(item, value)
  # returns the new list item
  def insert_after(item, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # TODO
  end

  # insert(i, value)
  # always returns self
  def insert(index, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # TODO
  end

  # remove_item(item)
  # returns a value of the removed item
  def remove_item(item)
    # raises WrongListException if item.list != self
    # TODO
  end

  # remove(i)
  # returns the removed value
  def delete_at(index)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # TODO
  end

  # append(value)
  # always returns self
  def <<(object)
    # TODO
    item = SinglyLinkedListItem.new(object, self)
    if @tail == nil
      @head = item
      @tail = item
      @head.next = @tail
    else
      @tail.next = item
      @tail = item
    end
    @length += 1
    return self
  end

  # prepend(value)
  # always returns self
  def unshift(object)
    # TODO
  end

  # converts self to a standard Ruby Array (already done)
  def to_a
    result = []
    self.each do |item|
      result << item
    end
    return result
  end

end
x = SinglyLinkedList.new
x << 1
x << 0
p x