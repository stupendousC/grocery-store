require 'csv'
require 'awesome_print'

class Customer
  attr_reader :id
  attr_accessor :email, :address
  
  def initialize(id=nil, email=nil, address_hash = {street:nil, city:nil, state:nil, zip:nil})
    @email = email
    @address = address_hash
    @id = id
  end
  
  def self.all
    # returns array of all Customer instances from data/customers.csv
    file = "data/customers.csv"
    all_customers = []
    
    CSV.read(file).each do |line|
      id = line[0].to_i
      email = line[1]
      address_hash = {street:line[2], city:line[3], state:line[4], zip:line[5]}
      new_customer = Customer.new(id, email, address_hash)
      all_customers << new_customer
    end
    
    return all_customers
  end
  
  def self.find(id)
    # returns Customer instance matching the id number
    all_customers = self.all
    return all_customers.find { |customer| customer.id == id }
  end
  
end

