require_relative 'classes/classroom'
require_relative 'classes/student'
require_relative 'classes/teacher'

# app/app.rb
class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('Microverse')
  end

  def show_menu
    puts 'Please choose an option by entering a number'
    puts '1.- List all books'
    puts '2.- List all people'
    puts '3.- Create a person'
    puts '4.- Create a book'
    puts '5.- Create a rental'
    puts '6.- List all rentals for a given person id'
    puts '7.- Exit'
    puts "\n"
    print 'Option: '
    op = gets.chomp

    Integer(op)
  end

  def generate_new_person_id
    new_id_found = true
    new_id = 0

    until new_id_found
      new_id = rand(1...1000)
      @persons.each do |person|
        if person.id == new_id
          new_id_found = false
          break
        end
      end
    end
    new_id
  end

  def create_student
    is_data_ok = false
    age = 0
    name = ''
    parent_permission = false
    while is_data_ok != true
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]'
      parent_permission_response = gets.chomp
      parent_permission = false if %w[n N].include? parent_permission_response
      parent_permission = true if %w[y Y].include? parent_permission_response

      print "\nis all the information correct? [Y/N]"
      data_ok_response = gets.chomp
      is_data_ok = false if %w[n N].include? data_ok_response
      is_data_ok = true if %w[y Y].include? data_ok_response
    end

    Student.new(@classroom, age, name, parent_permission: parent_permission)
  end

  def create_teacher
    is_data_ok = false
    age = 0
    name = ''
    specialization = ''
    while is_data_ok != true
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp

      print "\nis all the information correct? [Y/N]"
      data_ok_response = gets.chomp
      is_data_ok = false if %w[n N].include? data_ok_response
      is_data_ok = true if %w[y Y].include? data_ok_response
    end

    Teacher.new(specialization, age, name, parent_permission: true)
  end

  def create_person
    puts 'Do you want to create'
    puts '1.- Student'
    puts '2.- Teacher'
    puts '3.- Cancel'
    puts "\n"

    print 'Option: '
    op = Integer(gets.chomp)

    case op
    when 1
      new_student = create_student
      new_student.id = generate_new_person_id
      @persons << new_student
      print "Student created successfully\n"
    when 2
      new_teacher = create_teacher
      new_teacher.id = generate_new_person_id
      @persons << new_teacher
      print "Teacher created successfully\n"
    end
  end

  def run
    op = 0
    while op != 7
      op = show_menu

      case op
      when 1
        puts 'one'
      when 2
        puts 'two'
      when 3
        create_person
      when 4
        puts 'four'
      when 5
        puts 'five'
      when 6
        puts 'six'
      when 7
        puts 'bye'
      end
    end
  end
end

def main
  app = App.new
  app.run
end

main
