require_relative 'person'
# app/classes/student.rb
class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hockey
    "¯\(ツ)/¯"
  end
end
