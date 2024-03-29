require_relative 'nameable'
require_relative 'rental'

# app/classes/person.rb
class Person < Nameable
  attr_accessor :rentals, :id

  private

  def of_age?
    @age >= 18
  end

  public

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = 0
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def name(name)
    @name = name
  end

  def age(age)
    @age = age
  end

  def name?
    @name
  end

  def age?
    @age
  end

  def id?
    @id
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
