class Customer
  attr_reader :name, :age, :email

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    @age = options[:age]
    @email = options[:email]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name (name)
    Customer.all.each do |person|
      if person.name == name
        return person
      end
    end
  end

  def purchase product
    Transaction.new(self, product)
  end

  private

  def add_to_customers
    Customer.all.each do |person|
      if person.name == "#{@name}"
        raise DuplicateCustomerError, "#{@name} already exists."
      end
    end
    @@customers << self
  end
end
