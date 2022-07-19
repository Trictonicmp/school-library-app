# app/classes/classroom.rb
class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student if !@students.include?(student)
  end
end
