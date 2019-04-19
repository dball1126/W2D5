class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    index = key.hash % num_buckets
    unless @store[index].include?(key)
      @store[index] << key  
      @count += 1
      if @count == num_buckets
        resize!
      end
    end
  end

  def include?(key)
    index = key.hash % num_buckets
    @store[index].include?(key)
  end

  def remove(key)
    index = key.hash % num_buckets
    if @store[index].include?(key)
      @store[index].delete(key)
      @count -= 1
    end
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
      index = el.hash % new_size
      unless resized_store[index].include?(el)
        resized_store[index] << el
        @count += 1
      end
    end
    
    @store = resized_store
  end
end
