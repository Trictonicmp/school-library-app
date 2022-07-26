require_relative 'menu_options/list_books'
require_relative 'menu_options/list_persons'
require_relative 'menu_options/create_person'
require_relative 'menu_options/create_book'
require_relative 'menu_options/create_rental'
require_relative 'menu_options/list_rentals'
# app/classes/app_manager
class AppManager
  def initialize(state)
    @list_books = ListBooks.new(state)
  end
end