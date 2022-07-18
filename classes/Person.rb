class Person
  @id
  @name
  @age
  @parent_permission

  private
  def is_of_age?
    return @age >= 18
  end

  public
  def initialize(name = "Unknown", parent_permission = true, age)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def get_id
    @id
  end

  def get_name
    @name
  end

  def get_age
    @age
  end

  def set_name(name)
    @name = name
  end

  def set_age(age)
    @age = age
  end

  def set_can_use_services(can_use)
    @can_use_services = can_use
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end
end

=begin 
person = Person.new("Amaury", false, 26)
person.get_name
person.get_age
person.can_use_services?
person.set_can_use_services(true)
person.can_use_services?

person.set_name("Mario")
person.set_age(16)
person.set_can_use_services(true)
person.get_name
person.get_age
person.can_use_services? 
=end