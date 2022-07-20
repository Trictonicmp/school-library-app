require_relative 'classes/classroom'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'helpers/helpers'

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

  def list_books
    if @books.empty?
      print "There are no books\n"
      return
    end
    @books.each do |book|
      print "Title: \"#{book.title}\", Author: \"#{book.author}\"\n"
    end
    print "\n"
  end

  def list_persons
    if @persons.empty?
      print "There are no persons\n"
      return
    end
    @persons.each do |person|
      print "[#{person.class}] Name: #{person.name?}, "
      print "ID: #{person.id}, "
      print "Age: #{person.age?}\n"
    end
    print "\n"
  end

  def create_student
    age = 0
    name = ''
    parent_permission = false
    until_data_ok {
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]'
      parent_permission = parse_response(gets.chomp)
    }
    Student.new(@classroom, age, name, parent_permission: parent_permission)
  end

  def create_teacher
    age = 0
    name = ''
    specialization = ''
    until_data_ok {
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
    }
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
      new_student.id = generate_new_person_id(@persons)
      print "Student created successfully\n"
      new_student
    when 2
      new_teacher = create_teacher
      new_teacher.id = generate_new_person_id(@persons)
      print "Teacher created successfully\n"
      new_teacher
    end
  end

  def create_book
    title = ''
    author = ''
    until_data_ok {
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
    }
    Book.new(title, author)
  end

  def run
    op = 0
    while op != 7
      op = show_menu

      case op
      when 1
        list_books
      when 2
        list_persons
      when 3
        @persons << create_person
      when 4
        @books << create_book
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
