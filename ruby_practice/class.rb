class Customer
  @@no_of_customers = 0
  #customer method to create object
  def initialize(id, name, addr)
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
  end
end

cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
# cust2 = Customer.new

class Sample
  def hello
    puts "Hello Ruby"
  end
end

object = Sample.new
object.hello
