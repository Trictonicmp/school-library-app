require_relative '../core/book_lister'

# app/classes/menu_options/list_books.rb
class ListBooks
  def initialize(state)
    @books_list = state.books
    @book_lister = BookLister.new(state.books)
  end

  def list_books
    if @books_list.empty?
      print "There are no books\n\n"
      return
    end
    puts 'Books list'
    @book_lister.list_books
    print "\n"
  end
end