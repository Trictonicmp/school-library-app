require_relative 'nameable'

# app/classes/person.rb
class Person < Nameable
  private

  def of_age?
    @age >= 18
  end

  public

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = 0
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
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
end
