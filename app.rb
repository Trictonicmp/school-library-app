require_relative 'classes/core/classroom'
require_relative 'classes/core/student'
require_relative 'classes/core/teacher'
require_relative 'classes/core/book'
require_relative 'classes/core/person_creator'
require_relative 'classes/state_manager'
require_relative 'classes/app_manager'
require_relative 'helpers/helpers'
require 'date'

# app/app.rb
class App
  def initialize
    @state = StateManager.new
    @app_manager = AppManager.new(@state)
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
    if @state.books.empty?
      print "There are no books\n\n"
      return
    end
    @app_manager.book_lister.list_books
    puts 'Books list'
    print "\n"
  end

  def list_persons
    if @state.persons.empty?
      print "There are no persons\n\n"
      return
    end
    puts 'Persons list'
    @app_manager.person_lister.list_persons
    print "\n"
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
      new_student = @app_manager.person_creator.create_student
      new_student.id = generate_new_person_id(@state.persons)
      print "Student created successfully\n\n"
      new_student
    when 2
      new_teacher = @app_manager.person_creator.create_teacher
      new_teacher.id = generate_new_person_id(@state.persons)
      print "Teacher created successfully\n\n"
      new_teacher
    end
  end

  def choose_book
    op = until_valid_option(0, @state.books.length) do
      puts 'Select a book from the following list by number'
      @app_manager.book_lister.list_books_with_index
    end
    @state.books[op]
  end

  def choose_person
    op = until_valid_option(0, @state.persons.length) do
      puts 'Select a person from the following list by number (not id)'
      @app_manager.person_lister.list_persons_with_index
    end
    @state.persons[op]
  end

  def create_rental
    if @state.books.empty?
      print "There are no books\n\n"
      return
    end
    if @state.persons.empty?
      print "There are no persons\n\n"
      return
    end
    choosen_book = choose_book
    print "\n"
    choosen_person = choose_person
    print "\n"

    print 'Date [AAAA/MM/DD]: '
    date = gets.chomp

    print "Rental created successfully\n\n"
    Rental.new(date, choosen_book, choosen_person)
  end

  def list_rentals
    print 'Person ID: '
    id = Integer(gets.chomp)
    choosen_person = nil
    puts 'Rentals: '
    @state.persons.each do |person|
      choosen_person = person if person.id == id
    end
    return if choosen_person.nil?

    choosen_person.rentals.each do |rental|
      print "Date: #{rental.date}, "
      print "Book: #{rental.book.title}, "
      print "Person: #{rental.person.name?}\n"
    end
    print "\n\n"
  end

  def run
    op = show_menu

    case op
    when 1
      list_books
    when 2
      list_persons
    when 3
      @state.persons << create_person
    when 4
      @state.books << @app_manager.book_creator.create_book
    when 5
      @state.rentals << create_rental
    when 6
      list_rentals
    else
      puts 'bye'
      exit
    end

    run
  end
end
