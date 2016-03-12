class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
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
