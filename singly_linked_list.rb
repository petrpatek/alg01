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
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length) -
    # index of bound mi tu moc nedává smysl a podle materiálů by měla metoda vyhazovat:  throw Exception if seznam != item.seznam
    # TODO
    raise WrongListException.new(item, self) if item.list != self
    result = nil
    if item === @head
      unshift(object)
      result = @head
    else
      item_new = SinglyLinkedListItem.new(object, self)
      item_new.next = item
      item_before = @head
      item_search = @head.next
      continue = true
      while continue
        if item_search == item
          item_before.next = item_new
          result = item_new
          continue = false
          @length += 1
        else
          item_before = item_before.next
          item_search = item_search.next
        end
      end
    end
    return result
  end

  # insert_after(item, value)
  # returns the new list item
  def insert_after(item, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # index of bound mi tu moc nedává smysl a podle materiálů by měla metoda vyhazovat:  throw Exception if seznam != item.seznam
    # TODO
    raise WrongListException.new(item, self) if item.list != self
    if item == @tail
      self << object
    else
      item_new = SinglyLinkedListItem.new(object, self)
      item_new.next = item.next
      item.next = item_new
      @length += 1
      item_new
    end
  end

  # insert(i, value)
  # always returns self
  def insert(index, object)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # TODO
    raise IndexOutOfBoundsException.new(index, @length) if index < 0 || index > @length
    insert_before(get_item(index), object) if index < @length
    insert_after(@tail, object) if index == @length
    return self
  end

  # remove_item(item)
  # returns a value of the removed item
  def remove_item(item)
    # raises WrongListException if item.list != self
    # TODO
    raise WrongListException.new(item, self) if item.list != self
    result = nil
    if item == @head
      @head = item.next
      @length -= 1
      result = item.object
    else
      continue = true
      item_before = @head
      item_to_delete = @head.next
      while continue
        if item_to_delete == item
          item_before.next = item_to_delete.next
          @length -= 1
          continue = false
          result = item_to_delete.object
        else
          item_before = item_before.next
          item_to_delete = item_to_delete.next
        end
      end
    end
    return result
  end

  # remove(i)
  # returns the removed value
  def delete_at(index)
    # raises IndexOutOfBoundsException if index is out of bounds [0, @length)
    # TODO
    raise IndexOutOfBoundsException.new(index, @length) if index < 0 || index > @length
    remove_item(get_item(index))

  end

  # append(value)
  # always returns self
  def <<(object)
    # TODO
    item = SinglyLinkedListItem.new(object, self)
    if @tail == nil
      @head = item
      @tail = item
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
    new_item = SinglyLinkedListItem.new(object, self)
    if @tail == nil
      @head = new_item
      @tail = new_item
    else
      new_item.next = @head
      @head = new_item
    end
    @length += 1
    return self

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
x.unshift(4)
x.insert_before(x.find(1), 5)
x.insert_before(x.find(0), 2)
p x.to_a