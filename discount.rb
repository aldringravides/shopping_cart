class Discount
	@@discounts = Array.new
	attr_accessor :discount_code, :discount_price
	
	def initialize values
	  @discount_code = values[:discount_code]
	  @discount_price = values[:discount_price]
	end
	
	def save
	  @@discounts << self
	end
	
	def compute
	  case self.discount_code
	  when "1"
	    # 3 for 2 1GB
	    ult_small = Product.find_by_product_code "ult_small"
	    ult_small_count = Item.find_all_by_product_code ult_small.product_code
	    self.discount_price = ult_small_count.count.div(3) * ult_small.product_price
	  when "2"
	  	# more than 3 5GB
	  	ult_large_new_price = 39.90
	    ult_large = Product.find_by_product_code "ult_large"
	    ult_large_count = Item.find_all_by_product_code ult_large.product_code
	    if ult_large_count.count >= 3
	    	self.discount_price = ult_large_count.count * (ult_large.product_price - ult_large_new_price)
	    end
	  when "3"
	    # free 1GB Data Pack for every 2GB Sim
	    ult_medium = Product.find_by_product_code "ult_medium"
	    ult_medium_count = Item.find_all_by_product_code ult_medium.product_code
	    unless ult_medium_count.nil?
	    	items = Item.all
	    	item_with_1gb_zero = items.select{|item| item.product_price == 0.00 and item.product_code == "1gb"}
	 		item_with_2gb = Item.find_all_by_product_code "ult_medium"
	 		item_to_be_created = (item_with_2gb.count - item_with_1gb_zero.count)
	 		item_to_be_created.times do |item|
		    	item = Item.new product_code: "1gb", product_price: 0.00, quantity: 1, promo_code: ""
		    	item.save
	    	end
	    end
	  when "4"
	    # 1<3AMAYSIM promo applied
	    items = Item.all
	    promo_code = "I<3AMAYSIM"
	    existing_promo_code = items.select{ |item| item.promo_code == promo_code}
	    if existing_promo_code.count > 0
		    discount_percent = 0.1
		    item = ShoppingCart.current_item
		    self.discount_price =  (item.total_price * discount_percent)
	    end
	  else
	  end
	end
	
	class << self
		def all
			@@discounts
		end
		def clear
			@@discounts = Array.new
		end
	end
end
