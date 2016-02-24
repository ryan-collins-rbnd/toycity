require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
date = Time.new.localtime
puts date

# Store the JSON data as an array of items
items = products_hash["items"]

# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

class Toy
  # Define getter for title
  attr_accessor :title
  
    # Initialize instance variables for the class
    def initialize(item)
      @title = item["title"]
      @price = item["full-price"]
      @purchases = item["purchases"]
      @total_purchases = 0
      @average_price = 0.0
      @total_sales = 0.0
      @average_discount = 0.0
      @total_discount = 0.0
      calculate_purchases
    end
  
    def calculate_average_discount
      # Only if the average price is less than the price,
      # Calculate the average discount
      if @average_price < @price 
        @average_discount = @price - @average_price
      end
    end
  
  
    def calculate_purchases
      @purchases.each do |purchase|
        @total_purchases += 1
        @total_sales += purchase["price"]
      end
      @average_price = @total_sales / @total_purchases
      calculate_average_discount
    end
  
  end

  class ReportGenerator
    def initialize(items)
      @items = items
    end
    

        puts " _                         _     "
	      puts "| |                       | |    "
	      puts "| |__  _ __ __ _ _ __   __| |___ "
	      puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	      puts "| |_) | | | (_| | | | | (_| \\__ \\"
	      puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	      puts
	 

	    puts "##########################################"
      puts "                     _            _       "
      puts "                    | |          | |      "
      puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
      puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
      puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
      puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
      puts "| |                                       "
      puts "|_|                                       "
      puts 
      puts "##########################################"
  end
  
    def print_report
      #print the product header
 
        print_product_header   
    # For each item, print the details  
      @items.each do |item|
        some_toy = Toy.new(item)
      
        # Output the report
        puts "#{some_toy.title}"
        puts "******************************"
        puts "Retail Price     |    $#{some_toy.price}"
        puts "Total Purchase   |    #{some_toy.total_purchases}"
        puts "Total Sales      |    $#{some_toy.total_sales}"
        puts "Average Price    |    $#{some_toy.average_price}"
        puts "Average Discount |    %#{some_toy.average_discount}"
        puts "*******************************\r\n\r\n"
      end
    end
    

    
  end

  Report = ReportGenerator.new(items)
  Report.print_report
  


# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined