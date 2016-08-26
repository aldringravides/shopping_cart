class Product
	@@products = Array.new
	attr_accessor :product_code, :product_name, :product_price
	class << self
		def all
		  @@products	
		end
		def find_by_product_code product_code
			@@products.select{ |product| product.product_code == product_code }.first
		end
		def seeds
			# populate Product
			product_code = %w"ult_small ult_medium ult_large 1gb"
			product_name = ["Unli 1GB", "Unli 2GB", "Unli 5GB", "1GB Data Pack"]
			product_price = [24.90, 29.90, 44.90, 9.90]
			product_code.count.to_i.times do |p|
			  product = Product.new(product_code: product_code[p], product_name: product_name[p], product_price: product_price[p])
			  product.save
			end
		end
	end
	def initialize values
	  @product_code = values[:product_code]
	  @product_name = values[:product_name]
	  @product_price = values[:product_price]
	end
	def product_code
		@product_code
	end
	def product_name
		@product_name
	end
	def product_price
		@product_price
	end
	def save
	  @@products << self
	end
end
