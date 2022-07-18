# frozen_string_literal: true

# app/classes/person.rb
class Person
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
  end

  def name?(name)
    @name = name
  end

  def age?(age)
    @age = age
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end

#
# person = Person.new("Amaury", false, 26)
# person.get_name
# person.get_age
# person.can_use_services?
# person.set_can_use_services(true)
# person.can_use_services?
#
# person.set_name("Mario")
# person.set_age(16)
# person.set_can_use_services(true)
# person.get_name
# person.get_age
# person.can_use_services?
