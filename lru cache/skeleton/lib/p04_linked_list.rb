class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def inspect
    (@key + " " + @val).inspect
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = Node.new(:head, nil)
    @tail = Node.new(:tail, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    # @head.next.key == :tail
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)

    each do |node|
      return node.val if node.key == key 
    end
    
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    old_last = @tail.prev

    old_last.next = new_node
    @tail.prev = new_node
    
    new_node.prev = old_last
    new_node.next = @tail
  end

  def update(key, val)

    self.each do |node|
      if node.key == key
        node.val = val
      end
    end

  end

  def remove(key)

    each do |node|
      if node.key == key
        remove_node = node 
        break
      end
    end

    if !remove_node.nil?
       prev_node = remove_node.prev
       next_node = remove_node.next
    end


  end

  def each(&prc)
    node = first
    while node.next != nil
      prc.call(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
