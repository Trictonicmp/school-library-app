require_relative 'classes/classroom'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/person_creator'
require_relative 'helpers/helpers'
require 'date'

# app/app.rb
class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('Microverse')
    @person_creator = PersonCreator.new
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
      print "There are no books\n\n"
      return
    end
    puts 'Books list'
    @books.each do |book|
      print "Title: \"#{book.title}\", Author: \"#{book.author}\"\n"
    end
    print "\n"
  end

  def list_persons
    if @persons.empty?
      print "There are no persons\n\n"
      return
    end
    puts 'Persons list'
    @persons.each do |person|
      print "[#{person.class}] Name: #{person.name?}, "
      print "ID: #{person.id}, "
      print "Age: #{person.age?}\n"
    end
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
      new_student = @person_creator.create_student
      new_student.id = generate_new_person_id(@persons)
      print "Student created successfully\n\n"
      new_student
    when 2
      new_teacher = @person_creator.create_teacher
      new_teacher.id = generate_new_person_id(@persons)
      print "Teacher created successfully\n\n"
      new_teacher
    end
  end

  def choose_book
    option_is_valid = false
    until option_is_valid
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        print "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n"
      end
      print 'Option: '
      op = Integer(gets.chomp)
      option_is_valid = true if op <= (@persons.length - 1)
      print "Wrong item, try again \n\n" if op > (@persons.length - 1)
    end
    @books[op]
  end

  def choose_person
    option_is_valid = false
    until option_is_valid
      puts 'Select a person from the following list by number (not id)'
      @persons.each_with_index do |person, index|
        print "#{index}) ID: #{person.id}, Name: #{person.name?}, Age: #{person.age?}\n"
      end
      print 'Option: '
      op = Integer(gets.chomp)
      option_is_valid = true if op <= (@persons.length - 1)
      print "Wrong item, try again\n\n" if op > (@persons.length - 1)
    end
    @persons[op]
  end

  def create_rental
    if @books.empty?
      print "There are no books\n\n"
      return
    end
    if @persons.empty?
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
    @persons.each do |person|
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
      @persons << create_person
    when 4
      @books << create_book
    when 5
      @rentals << create_rental
    when 6
      list_rentals
    else
      puts 'bye'
      exit
    end

    run
  end
end
