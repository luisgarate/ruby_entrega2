class Product
  attr_accessor :code, :name, :price

  def initialize(code,name,price)
    @code = code
    @name = name
    @price = Float(price)
  end
end