require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name, parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new(4, 26, "Amaury", false)
teacher.name?
teacher.age?
teacher.can_use_services?

teacher.name("Mario")
teacher.age(16)
teacher.name?
teacher.age?
teacher.can_use_services?
