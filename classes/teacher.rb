require_relative 'person'
# app/classes/person.rb
class Teacher < Person
  def initialize(specialization, age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
