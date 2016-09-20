
class BookInStock
  attr_accessor :isbn, :price
  def initialize(is, pri)
    if (!is.empty? && pri > 0.0)
      @isbn = is
      @price = pri
    else
      raise ArgumentError
    end
  end
	
  def price_as_string
    str = @price.round(2).to_s
    if (str[str.size-2] == '.')
      str += '0'
    end
    puts '$' + str
  end
end
