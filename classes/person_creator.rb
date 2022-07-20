require_relative '../helpers/helpers'

# app/classes/person_creator.rb
class PersonCreator
  def create_student
    age = 0
    name = ''
    parent_permission = false
    until_data_ok do
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]'
      parent_permission = parse_response(gets.chomp)
    end
    Student.new(@classroom, age, name, parent_permission: parent_permission)
  end

  def create_teacher
    age = 0
    name = ''
    specialization = ''
    until_data_ok do
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
    end
    Teacher.new(specialization, age, name, parent_permission: true)
  end
end
