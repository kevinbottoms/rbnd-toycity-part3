class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product)
    @customer = customer
    @product = product
    if product.stock <= 0
      raise OutOfStockError, "#{@product.title} is out of stock."
    else
      product.sell_item
      @@transactions << self
      @id = @@transactions.count
    end
  end

  def self.all
    return @@transactions
  end

  def self.find number
    @@transactions[number - 1]
  end

end
