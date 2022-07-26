require_relative 'core/book_lister'
require_relative 'core/book_creator'
require_relative 'core/person_lister'
require_relative 'core/person_creator'
# app/classes/app_manager
class AppManager
  attr_reader :book_creator
  attr_reader :book_lister
  attr_reader :person_lister
  attr_reader :person_creator
  def initialize(state)
    @book_lister = BookLister.new(state.books)
    @book_creator = BookCreator.new
    @person_lister = PersonLister.new(state.persons)
    @person_creator = PersonCreator.new
  end
end