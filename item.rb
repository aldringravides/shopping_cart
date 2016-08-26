class Item
	@@items = Array.new
	attr_accessor :product_code, :product_price, :quantity, :promo_code
	
	def initialize values
	  @product_code = values[:product_code]
	  @product_price = values[:product_price]
	  @quantity = values[:quantity]
	  @promo_code = values[:promo_code]
	end
	
	def save
		@@items << self
	end
	
	def update values = {}
		values.each do |key, value|
		  self.send("#{key}=", value)
		end
	end

	class << self
		def all
		  @@items
		end
		
		def find_by_product_code product_code
			products = Item.all
			if products.count > 0
			  products.select{ |product| product.product_code == product_code }.first
			end
		end
		
		def find_all_by_product_code product_code
			products = Item.all
			if products.count > 0
			  products.select{ |product| product.product_code == product_code }
			end			
		end
		
		def clear
		  @@items = Array.new
		end
	end
end
