module Analyzable
  # count_by_brand(*brands)
  # @param [Product]
  # @return { :brand_name => count }
  #
  # ====== Example
  # Analyzable::count_by_brand(Product.all)
  # #=> {"Lego"=>3, "Fisher-Price"=>2, "Nintendo"=>1, "Crayola"=>2, "Hasbro"=>2}
  def count_by_brand(products)
    #Create an array of brands
    brands = products.map { |p| p.brand }
    # Inject a hash with the count for each particular brand
    brands_hash = brands.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
    brands_hash
  end

  # Count by name takes products and returns a hash showing the Count
    # NOTE: This could be refactored using metaprogramming for co
  # @param [Product]
  # @return { :product_name => count }
  #
  #======= Example
  # Analyzable::count_by_name(Product.all)
  # #=> {"Sleek Linen Watch"=>2,
  # "Heavy Duty Iron Bottle"=>5,
  # "Lightweight Paper Table"=>1,
  # "Heavy Duty Wool Shirt"=>1,
  # "Enormous Paper Computer"=>1}
  def count_by_name(products)
    #Create an array of brands
    names = products.map { |p| p.name }
    # Inject a hash with the count for each particular brand
    name_hash = names.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total }
    name_hash
  end

  # average_price, takes an array of products and returns
  # the average price of all of the products rounded to two decimal points
  # @param [Product]
  # @return average_price
  def average_price products
    # Create a new array with the prices to floart
    prices = products.map { |p| p.price.to_f  }
    avg = prices.inject(:+).to_f / prices.size
    avg.round(2)
  end

  # Takes options hash and compiles output seperated by carriage returns
  # @param options = {}
  # @return output: string formatted with carriage returns
  #
  def inventory_output opts={}
    output = []
    opts.each do |key, value|
      output << " - #{key}: #{value}"
    end
    output.join("\n")
  end

  # print_report compiles the output and returns in.  Make sure to print or put it.
  # @param [Product]
  # @return Report: average price, counts by brand, and counts by product name.
  #
  #====== Example
  # Analyzable::print_report(Product.all)
  #=> Average Price: $51.6
  # Inventory by Brand:
  # - Hasbro: 5
  # - Fisher-Price: 1
  # - Crayola: 2
  # - Lego: 2
  # Inventory by Name:
  # - Incredible Copper Bag: 3
  # - Synergistic Rubber Car: 2
  # - Aerodynamic Marble Computer: 3
  # - Synergistic Wooden Chair: 2
  def print_report products
    brands_hash = count_by_brand products
    products_hash = count_by_name products
    output ||= "Average Price: $#{average_price(products)}\n"
    output += "Inventory by Brand: \n"
    output += inventory_output brands_hash
    output += "\nInventory by Name: \n"
    output += inventory_output products_hash
    output
  end
end
