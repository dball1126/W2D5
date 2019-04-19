class MaxIntSet
  attr_reader :max
  
  def initialize(max)
    @max = max
    @array = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @array[num] = true if @array[num] == false

    
  end

  def remove(num)
    @array[num] = false
  end

  def include?(num)
    return false if @array[num].nil?
    @array[num]
  end

  private

  def is_valid?(num)
    return false if num < 0 || num > @array.size 
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    index = num % num_buckets
    @store[index] << num 
  end

  def remove(num)
    index = num % num_buckets
    @store[index].delete(num)
  end

  def include?(num)
    index = num % num_buckets
    @store[index].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    index = num % num_buckets
    unless @store[index].include?(num)
      @store[index] << num  
      @count += 1
      if @count == num_buckets
        resize!
      end
    end
  end

  def remove(num)
    index = num % num_buckets
    if @store[index].include?(num)
      @store[index].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    index = num % num_buckets
    @store[index].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    resized_store = Array.new(num_buckets * 2) { Array.new }
    new_size = num_buckets * 2
    @count = 0

    
    @store.flatten.each do |el|
      index = el % new_size
      unless resized_store[index].include?(el)
        resized_store[index] << el
        @count += 1
      end
    end
    


    @store = resized_store
  end
end
