class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
        
      hashed = self[0]
      (1...self.length).each do |i|
        hashed ^= self[i] * i
      end

      hashed.hash
        
  end
end

class String
  def hash

      string = self.bytes

      hashed = string[0].to_i
      (1...string.length).each do |i|
        hashed ^= string[i].to_i * i
      end

      hashed.hash
      
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # flat_arr = self.flatten(5)
    # hash_num = flat_arr[0]
    # flat_arr[1..-1].map! do |el|
    #   if el.is_a?(Integer)
    #    hash_num ^= el.hash
    #   else 
    #    hash_num^= el.bytes.length.hash
    #   end
    # end

    #   hash_num.hash
      0
    end
end
