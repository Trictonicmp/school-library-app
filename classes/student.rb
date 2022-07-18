require_relative 'person.rb'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hockey
    "¯\(ツ)/¯"
  end
end

student = Student.new(4, 26, "Amaury", false)
student = Student.new(4, 26, "Amaury", false)
student.name?
student.age?
student.can_use_services?

student.name("Mario")
student.age(16)
student.name?
student.age?
student.can_use_services?