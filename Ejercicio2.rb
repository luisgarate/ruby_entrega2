class Purchase
	attr_accessor :products, :total
	
	def initialize
	  @products = []
		@total = 0
	end

	def add elem
		@products << elem
		@total += elem.price	
	end
	
	def delete elem
		@total -= elem.price
		@products.delete(elem)
	end
		
	def apply_discount
		yield	self	
	end
end

#Casos de pruebas
# 13 productos creados, repetidos y en distinto orden
p1 = Product.new '01', 'Martillo', '50'
p2 = Product.new '02', 'Clavos x 100', '10'
p3 = Product.new '02', 'Clavos x 100', '10'
p4 = Product.new '02', 'Clavos x 100', '10'
p5 = Product.new '01', 'Martillo', '50'
p6 = Product.new '01', 'Martillo', '50'
p7 = Product.new '03', 'Tornillo x 100', '20'
p8 = Product.new '03', 'Tornillo x 100', '20'
p9 = Product.new '03', 'Tornillo x 100', '20'
p10 = Product.new '03', 'Tornillo x 100', '20'
p11 = Product.new '03', 'Tornillo x 100', '20'
p12 = Product.new '03', 'Tornillo x 100', '20'
p13 = Product.new '03', 'Tornillo x 100', '20'

# Compra creada y cargada con todos los productos
p = Purchase.new
p.add p1
p.add p2
p.add p3
p.add p4
p.add p5
p.add p6
p.add p7
p.add p8
p.add p9
p.add p10
p.add p11
p.add p12
p.add p13

p.total


# Descuento de 10% en tu compra si llevás algún martillo!
p.apply_discount do |purchase|
  hammers = purchase.products.collect { |product| product.code == '01' }
  purchase.total -= purchase.total * 0.1 if hammers.any?
end

p.total

#Descuento del 20% en tu compra si llevás mas de 10 productos
p.apply_discount do |purchase|
	purchase.total -= purchase.total * 0.2  if purchase.products.size > 10
end


#Descuento de 3x2, en todos los productos.
p.apply_discount do |purchase|
	counts = Hash.new(0)
	purchase.products.each { |elem| counts[elem.code] += 1 }
	
	prices = Hash.new(0)
	purchase.products.each { |elem| prices[elem.code] = elem.price }

	counts.each do |code, cant|
		item_price = prices.values_at(code)[0]
		purchase.total -= (cant / 3) * item_price
	end
end