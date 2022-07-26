require_relative 'core/book_lister'

#app /classes/book_manager.rb

class BookManager
  def initialize(books_list)
    @book_lister = BookLister.new(books_list)
  end
end