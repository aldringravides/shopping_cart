# Amaysim Shopping Cart Exercise

##Interface of the shopping cart would be
cart = ShoppingCart.new(pricingRule)
cart.add(item1)
cart.add(item2, promo_code)
cart.total
cart.items

##List of PricingRule/Special Offers
1. A 3 for 2 deal on Unli 1GB Sims. Example, buy 3 Unli 1GB sims you will pay the price of 2 only for the 1st month. (pricing_rule: "1")
2. Unli 5GB Sim will have a bulk dicount applied; whereby the price will drop to $ 39.90 each for the first month, if the customer buys more than 3 sims. (pricing_rule: "2")
3. We will bundle in a free 1GB Data pack free-f-charge with every Unlimited 2GB Sold. (pricing_rule: "3")
4. Adding the promo_code "I<3AMAYSIM" will apply a 10% discount across the board. (pricing_rule: "4")
 
##List of Products

1. Unli 1GB (price: $ 24.9, code: "ult_small")
2. Unli 2GB (price: $ 29.9, code: "ult_medium")
3. Unli 5GB (price: $ 44.9, code: "ult_large")
4. 1GB Data Pack (price: $ 9.9, code: "1gb")

##How to use

1. Load product.rb, item.rb, discount.rb, shopping_cart.rb
2. Populate Product table:
    Product.seeds
3. Add pricing_rule parameter in every new instance of ShoppingCart. Please look up for the pricing_rule code in every Special Offers listed in "List of PricingRule/Special Offers"
    cart = ShoppingCart.new("1")
4. Add items in the cart. Please look up for the code in every Products lised in "List of Products"
    cart.add("ult_small") for adding Unli 1GB
5. Add items with promo code. 
    cart.add("ult_small","I<3AMAYSIM")
6. Output all Items in the Shopping Cart.
    cart.items
7. Output Total Price of the Shopping Cart.
    cart.total
    
