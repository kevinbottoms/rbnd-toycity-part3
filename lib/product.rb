class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def in_stock?
    if @stock > 0
      return true
    else
      return false
    end
  end

  def self.all
    @@products
  end

  def self.find_by_title (name)
    Product.all.each do |item|
      if item.title == name
        return item
      end
    end
  end

  def self.in_stock
    stocked = []
    Product.all.each do |item|
      if item.stock > 0
        stocked << item
      end
    end
    return stocked
  end

  def sell_item
    @stock -= 1
  end

  private

  def add_to_products
    Product.all.each do |item|
      if item.title == "#{@title}"
        raise DuplicateProductError, "'#{@title}' already exists."
      end
    end
    @@products << self
  end
end
