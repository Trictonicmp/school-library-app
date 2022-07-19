# app/classes/rental.rb
class Rental
  attr_accessor :date, :book
  def initialize(date)
    @date = date
    @book = nil
  end
end