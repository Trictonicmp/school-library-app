require_relative 'student'
require_relative 'classroom'
require_relative '../../helpers/helpers'

# app/classes/core/person_creator.rb
class PersonCreator
  public
  def initialize
    @classroom = Classroom.new('Microverse')
  end
  
  def create_student
    age, name, parent_permission = ask_student_info
    Student.new(@classroom, age, name, parent_permission: parent_permission)
  end

  def create_teacher
    age, name, specialization = ask_teacher_info
    Teacher.new(specialization, age, name, parent_permission: true)
  end

  private
  def ask_student_info
    age = 0
    name = ''
    parent_permission = false
    until_data_ok do
      age, name = ask_common_data
      print 'Has parent permission? [Y/N]: '
      parent_permission = parse_response(gets.chomp)
    end

    return age, name, parent_permission
  end

  def ask_teacher_info
    age = 0
    name = ''
    specialization = ''
    until_data_ok do
      age, name = ask_common_data
      print 'Specialization: '
      specialization = gets.chomp
    end

    return age, name, specialization
  end

  def ask_common_data
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    return age, name
  end
end
