require_relative 'person'
# app/classes/student.rb
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.students&.push(self)
  end

  def play_hockey
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom = classroom
  end
end
