require_relative "errors"
require_relative "bank"

class Transaction
  attr_reader :customer, :product, :id

  @@id = 0
  @@transactions = []

  def initialize(customer, product, options = {quantity: 1, print_receipt: true})
    @customer = customer
    @product = product
    @@account = BankAccount.new(1000000.00) # Just initalize a new account for all transactions

    # Initialize the bank account for testing
    product.remove_stock!(options[:quantity])
    @id = increment_transaction_id

    make_transaction

    #Print a receipt as long as the option is on.
    unless options[:print_receipt] == false
      print_receipt(@id)
    end
  end

  # Class method for finding by ID
  def self.find(id)
    # Find a transaction by id
    @@transactions.find {|transaction| transaction.id == id }
  end

  # Class method for returning all transactions.
  def self.all
    @@transactions
  end

  def find_one(id)
    @@transactions.find {|transaction| transaction.id == id }
  end

  def print_receipt(id)
    transaction = find_one(id)
    unless transaction == nil
      puts "Receipt for transaction #{transaction.id}"
      puts "Product Bought: #{transaction.product.title}"
      puts "Customer Name: #{transaction.customer.name}"
      puts "Sale Price: #{transaction.product.price}"
    else
      raise UnkownTransactionError, "Unknown transaction of ID: #{id}"
    end
  end

  protected

  def increment_transaction_id
    @@id += 1
  end

  private

  def make_transaction
    options = {type: "deposit", amount: self.product.price}
    @@account.make_transaction(options) # The password should not be hardcoded, but it is here to demonstrate.
    add_to_transactions
  end

  def add_to_transactions
    @@transactions << self
  end
end