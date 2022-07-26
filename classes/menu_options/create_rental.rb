require_relative '../core/rental'
require_relative '../core/person_lister'
require_relative '../core/book_lister'
require_relative '../../helpers/helpers'

# app/classes/menu_options/create_rental.rb
class CreateRental
  public
  def initialize(state)
    @rentals_list = state.rentals
    @persons_list = state.persons
    @books_list = state.books
    @person_lister = PersonLister.new(state.persons)
    @book_lister = BookLister.new(state.books)
  end

  def create_rental
    if @books_list.empty?
      print "There are no books\n\n"
      return
    end
    if @persons_list.empty?
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
    @rentals_list << Rental.new(date, choosen_book, choosen_person)
  end

  private
  def choose_book
    op = until_valid_option(0, @books_list.length) do
      puts 'Select a book from the following list by number'
      @book_lister.list_books_with_index
    end
    @books_list[op]
  end

  def choose_person
    op = until_valid_option(0, @persons_list.length) do
      puts 'Select a person from the following list by number (not id)'
      @person_lister.list_persons_with_index
    end
    @persons_list[op]
  end
end