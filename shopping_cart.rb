class ShoppingCart
	@@shopping_item = Array.new
	def initialize pricing_rule = ""
		Item.clear
		Discount.clear
		discount_codes = pricing_rule.split(",")
		discount_codes.count.to_i.times do |rules|
			discount = Discount.new(discount_code: discount_codes[rules], discount_price: 0.00)
			discount.save
		end 
		@@shopping_item << self
	end
	def add product_code, promo_code = ""
		current_item = Item.find_by_product_code product_code
		added_product = Product.find_by_product_code product_code
		item = Item.new( { product_code: product_code,
				  product_price: added_product.product_price, promo_code: promo_code} )
		item.save
		compute_discount
	end
	def compute_discount
	  discounts = Discount.all
	  discounts.each do |discount|
	  	discount.compute
	  end
	end
	def items
	  items = Item.all
	  items = items.uniq { |c| c.product_code }
	  items.each do |item|
	  	item_count = Item.find_all_by_product_code item.product_code
	  	product = Product.find_by_product_code item.product_code
	  	puts "#{item_count.count} X #{product.product_name}"
	  end
	end
	
	def total_price
		# without discount
		items = Item.all
		total_price = 0.00
		items.each do |item|
			total_price += item.product_price
		end
		return total_price
	end
	def total_discount
		total_discount = 0.00
		discounts = Discount.all
		discounts.each do |discount|
			total_discount += discount.discount_price
		end
		return total_discount
	end
	
	def total
		return (total_price - total_discount).round(2)
	end
	class << self
		def current_item
			@@shopping_item.first
		end
	end
end
