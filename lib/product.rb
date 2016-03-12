class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    Product.all.each do |item|
      if item.title == "#{@title}"
        raise DuplicateProductError, "'#{:title}' already exists."
      end
    end
    @@products << self
  end
end
