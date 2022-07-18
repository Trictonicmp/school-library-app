# frozen_string_literal: true

# app/classes/person.rb
class Person
  private

  def of_age?
    @age >= 18
  end

  public

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = 0
    @name = name
    @age = age
    @parent_permission = parent_permission
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

  def can_use_services?
    of_age? || @parent_permission
  end
end
