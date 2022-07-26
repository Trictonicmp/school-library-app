require_relative 'menu_options/list_books'
require_relative 'menu_options/list_persons'
require_relative 'menu_options/create_person'
require_relative 'menu_options/create_book'
require_relative 'menu_options/create_rental'
require_relative 'menu_options/list_rentals'
# app/classes/app_manager
class AppManager
  def initialize(state)
    @list_books = ListBooks.new(state.books)
    @list_persons = ListPersons.new(state.persons)
    @create_person = CreatePerson.new(state.persons)
    @create_book = CreateBook.new(state.books)
    @create_rental = CreateRental.new(state)
    @list_rentals = ListRentals.new(state.persons)
  end

  def goto_option(option)
    case option
    when 1 then @list_books.list_books
    when 2 then @list_persons.list_persons
    when 3 then @create_person.create_person
    when 4 then @create_book.create_book
    when 5 then @create_rental.create_rental
    when 6 then @list_rentals.list_rentals
  end
end